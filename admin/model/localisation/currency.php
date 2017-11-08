<?php
class ModelLocalisationCurrency extends Model {
	public function addCurrency($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "currency SET title = '" . $this->db->escape($data['title']) . "', code = '" . $this->db->escape($data['code']) . "', symbol_left = '" . $this->db->escape($data['symbol_left']) . "', symbol_right = '" . $this->db->escape($data['symbol_right']) . "', decimal_place = '" . $this->db->escape($data['decimal_place']) . "', value = '" . $this->db->escape($data['value']) . "', status = '" . (int)$data['status'] . "', date_modified = NOW()");

		if ($this->config->get('config_currency_auto')) {
			$this->refresh(true);
		}

		$this->cache->delete('currency');
	}

	public function editCurrency($currency_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "currency SET title = '" . $this->db->escape($data['title']) . "', code = '" . $this->db->escape($data['code']) . "', symbol_left = '" . $this->db->escape($data['symbol_left']) . "', symbol_right = '" . $this->db->escape($data['symbol_right']) . "', decimal_place = '" . $this->db->escape($data['decimal_place']) . "', value = '" . $this->db->escape($data['value']) . "', status = '" . (int)$data['status'] . "', date_modified = NOW() WHERE currency_id = '" . (int)$currency_id . "'");

		$this->cache->delete('currency');
	}

	public function deleteCurrency($currency_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "currency WHERE currency_id = '" . (int)$currency_id . "'");

		$this->cache->delete('currency');
	}

	public function getCurrency($currency_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "currency WHERE currency_id = '" . (int)$currency_id . "'");

		return $query->row;
	}

	public function getCurrencyByCode($currency) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "currency WHERE code = '" . $this->db->escape($currency) . "'");

		return $query->row;
	}

	public function getCurrencies($data = array()) {
		if ($data) {
			$sql = "SELECT * FROM " . DB_PREFIX . "currency";

			$sort_data = array(
				'title',
				'code',
				'value',
				'date_modified'
			);

			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];
			} else {
				$sql .= " ORDER BY title";
			}

			if (isset($data['order']) && ($data['order'] == 'DESC')) {
				$sql .= " DESC";
			} else {
				$sql .= " ASC";
			}

			if (isset($data['start']) || isset($data['limit'])) {
				if ($data['start'] < 0) {
					$data['start'] = 0;
				}

				if ($data['limit'] < 1) {
					$data['limit'] = 20;
				}

				$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
			}

			$query = $this->db->query($sql);

			return $query->rows;
		} else {
			$currency_data = $this->cache->get('currency');

			if (!$currency_data) {
				$currency_data = array();

				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "currency ORDER BY title ASC");

				foreach ($query->rows as $result) {
					$currency_data[$result['code']] = array(
						'currency_id'   => $result['currency_id'],
						'title'         => $result['title'],
						'code'          => $result['code'],
						'symbol_left'   => $result['symbol_left'],
						'symbol_right'  => $result['symbol_right'],
						'decimal_place' => $result['decimal_place'],
						'value'         => $result['value'],
						'status'        => $result['status'],
						'date_modified' => $result['date_modified']
					);
				}

				$this->cache->set('currency', $currency_data);
			}

			return $currency_data;
		}
	}

	public function refresh($force = false) {
		if (extension_loaded('curl')) {
			
			if ($force) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "currency WHERE code != '" . $this->db->escape($this->config->get('config_currency')) . "'");
			} else {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "currency WHERE code != '" . $this->db->escape($this->config->get('config_currency')) . "' AND date_modified < '" .  $this->db->escape(date('Y-m-d H:i:s', strtotime('-1 day'))) . "'");
			}
											
			$curl = curl_init();
									
			curl_setopt($curl, CURLOPT_URL, 'http://www.cbr.ru/scripts/XML_daily.asp');
			curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
			curl_setopt($curl, CURLOPT_HEADER, false);
			curl_setopt($curl, CURLOPT_CONNECTTIMEOUT, 30);
			curl_setopt($curl, CURLOPT_TIMEOUT, 30);
			
			$content = curl_exec($curl);
			
			curl_close($curl);
			
			if(!empty($content)){
				$doc = new DOMDocument();
				$doc->loadXML($content);
				$valute = $doc->getElementsByTagName("Valute");
				
				$cur_val = $this->config->get('config_currency') == 'RUB' ? 'RUB' : $this->config->get('config_currency');
				
				foreach( $valute as $value ){
					$icn = $value->childNodes;
					$code = $icn->item(3)->nodeValue;
					$nom = intval($icn->item(5)->nodeValue);
					$value = floatval(str_replace(",", "." , $icn->item(9)->nodeValue));
					$ret[$code] = ($value/$nom);
				}
				
				if ($cur_val == 'RUB') {
					foreach ($query->rows as $result) {
						if($ret[$result['code']]){
						   $value = 1 / $ret[$result['code']];
		   
						   if ((float)$value) {
							   $this->db->query("UPDATE " . DB_PREFIX . "currency SET value = '" . (float)$value . "', date_modified = NOW() WHERE code = '" . $this->db->escape($result['code']) . "'");
						   }
						}
					}
				}
		
				if ($cur_val != 'RUB') {
					foreach ($query->rows as $result) {
						if($result['code'] == 'RUB') {
							$value = $ret[$cur_val];
							if ((float)$value) {
								$this->db->query("UPDATE " . DB_PREFIX . "currency SET value = '" . (float)$value . "', date_modified = NOW() WHERE code = 'RUB'");
							}
						} else {
							$value = $ret[$result['code']];
							if ((float)$value) {
							$val = (float)$ret[$cur_val] / (float)$value;
								$this->db->query("UPDATE " . DB_PREFIX . "currency SET value = '" . $val . "', date_modified = NOW() WHERE code = '" . $this->db->escape($result['code']) . "'");
							}
						}
					}
				}
			
			}	
				
			$this->db->query("UPDATE " . DB_PREFIX . "currency SET value = '1.00000', date_modified = NOW() WHERE code = '" . $this->db->escape($this->config->get('config_currency')) . "'");
			
			$this->cache->delete('currency');
		}
	}

	public function getTotalCurrencies() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "currency");

		return $query->row['total'];
	}
}