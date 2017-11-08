<?php
class ControllerModuleFeedback extends Controller {
	private $error = array();
	
	public function index($setting) {
		
		$this->data['i'] = $setting['id'];
		
		$this->data['captcha_id'] = rand(1000, 9000);
		
		$this->language->load('module/feedback');
		$this->data['setting'] = $setting;
		
		$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['text_address'] = $this->language->get('text_address');
		$this->data['text_telephone'] = $this->language->get('text_telephone');
		$this->data['text_fax'] = $this->language->get('text_fax');
		
		$this->data['entry_name'] = $this->language->get('entry_name');
		$this->data['entry_phone'] = $this->language->get('entry_phone');
		$this->data['entry_email'] = $this->language->get('entry_email');
		$this->data['entry_enquiry'] = $this->language->get('entry_enquiry');
		$this->data['entry_captcha'] = $this->language->get('entry_captcha');
		$this->data['reload_captcha'] = $this->language->get('reload_captcha');
		
		if (isset($this->error['name'])) {
			$this->data['error_name'] = $this->error['name'];
		} else {
			$this->data['error_name'] = '';
		}
		
		if (isset($this->error['phone'])) {
			$this->data['error_phone'] = $this->error['phone'];
		} else {
			$this->data['error_phone'] = '';
		}
		
		if (isset($this->error['email'])) {
			$this->data['error_email'] = $this->error['email'];
		} else {
			$this->data['error_email'] = '';
		}
		
		if (isset($this->error['enquiry'])) {
			$this->data['error_enquiry'] = $this->error['enquiry'];
		} else {
			$this->data['error_enquiry'] = '';
		}
		
		if (isset($this->error['captcha'])) {
			$this->data['error_captcha'] = $this->error['captcha'];
		} else {
			$this->data['error_captcha'] = '';
		}
		if (isset($this->error['required'])) {
			$this->data['error_required'] = $this->error['required'];
		} else {
			$this->data['error_required'] = '';
		}
		
		$this->data['button_send_enquiry'] = $this->language->get('button_send_enquiry');
		
		$this->data['action'] = HTTP_SERVER . 'index.php?route=module/feedback/feedback';
		$this->data['captchaURL'] = $this->url->link('module/feedback/captcha', '', 'SSL');
		$this->data['captchaURLreload'] = $this->url->link('module/feedback/captcha', '', 'SSL');
		$this->data['store'] = $this->config->get('config_name');
		$this->data['address'] = nl2br($this->config->get('config_address'));
		$this->data['telephone'] = $this->config->get('config_telephone');
		$this->data['fax'] = $this->config->get('config_fax');
		
		if (isset($this->request->post['wsf_name'])) {
			$this->data['name'] = $this->request->post['wsf_name'];
		} else {
			$this->data['name'] = '';
		}
		
		if (isset($this->request->post['wsf_phone'])) {
			$this->data['phone'] = $this->request->post['wsf_phone'];
		} else {
			$this->data['phone'] = '';
		}
		
		if (isset($this->request->post['wsf_email'])) {
			$this->data['email'] = $this->request->post['wsf_email'];
		} else {
			$this->data['email'] = '';
		}
		
		if (isset($this->request->post['wsf_enquiry'])) {
			$this->data['enquiry'] = $this->request->post['wsf_enquiry'];
		} else {
			$this->data['enquiry'] = '';
		}
		
		if (isset($this->request->post['wsf_captcha'])) {
			$this->data['captcha'] = $this->request->post['wsf_captcha'];
		} else {
			$this->data['captcha'] = '';
		}
		
		$this->id = 'webme_sidebar_feedback';
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/feedback.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/feedback.tpl';
		} else {
			$this->template = 'default/template/module/feedback.tpl';
		}
		
		$this->render();
		//$this->response->setOutput($this->render(TRUE), $this->config->get('config_compression'));
	}
	
	public function check_captcha() {
	
		if (!$this->request->post['wsf_captcha']) {
			return false;
		}
		
		if ($this->session->data['pin'][$this->request->post['wsf_captcha_id']] == $this->request->post['wsf_captcha']) {
			return true;
		} else {
			return false;
		}
		
	}
	
	public function feedback() {
		
		$this->language->load('module/feedback');
		
		if ($this->config->get('feedback_settings')) { 
			$settings = $this->config->get('feedback_settings');
		}
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate($settings)) {
			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->hostname = $this->config->get('config_smtp_host');
			$mail->username = $this->config->get('config_smtp_username');
			$mail->password = $this->config->get('config_smtp_password');
			$mail->port = $this->config->get('config_smtp_port');
			$mail->timeout = $this->config->get('config_smtp_timeout');
			$mail->setTo($this->config->get('config_email'));
			if (isset($this->request->post['wsf_email']) and !empty($this->request->post['wsf_email'])) {
				$mail->setFrom($this->request->post['wsf_email']);
			} else {
				$mail->setFrom($this->config->get('config_email'));
			}
			if (isset($this->request->post['wsf_name'])) {
				$setSender = $this->request->post['wsf_name'];
			} elseif (isset($this->request->post['wsf_email'])) {
				$setSender = $this->request->post['wsf_email'];
			} else {
				$setSender = 'Anonymous';
			}
			$mail->setSender($setSender);
			$mail->setSubject(sprintf($this->language->get('email_subject'), $setSender));
			
			$user_data = "";
			if (isset($this->request->post['wsf_name'])) {
				$user_data .= $this->language->get('entry_name')." ".$this->request->post['wsf_name']."\n";
			}
			if (isset($this->request->post['wsf_phone'])) {
				$user_data .= $this->language->get('entry_phone')." ".$this->request->post['wsf_phone']."\n";
			}
			if (isset($this->request->post['wsf_email'])) {
				$user_data .= $this->language->get('entry_email')." ".$this->request->post['wsf_email']."\n";
			}
			if (isset($this->request->post['wsf_enquiry'])) {
				$user_data .= "\n".$this->language->get('entry_enquiry')."\n";
				$enquiry = strip_tags(html_entity_decode($this->request->post['wsf_enquiry'], ENT_QUOTES, 'UTF-8'));
			} else {
				$enquiry = '';
			}
			
			$mail->setText($user_data.$enquiry);
			$mail->send();
			
			//$this->redirect(HTTPS_SERVER . 'index.php?route=module/webme_sidebar_feedback/success');
			$output["success"] = "ok";
			
			if (!isset($settings['settings_success']) or empty($settings['settings_success'])) {
				$output['result'] = $this->language->get('text_message');
			} else {
				$output['result'] = '<p>'.$settings['settings_success'].'</p>';
			}

			$output['result'] .= '<a id="one_more_msg_href'.$this->request->post['form_id'].'" href="javascript:">'.$this->language->get('text_send_another_enquiry').'</a>';
			sleep(1);
		} else {
			$output["error"] = "error";
			
			if (isset($this->error['name'])) {
				$output['error_name'] = $this->error['name'];
			} else {
				$output['error_name'] = '';
			}
			
			if (isset($this->error['phone'])) {
				$output['error_phone'] = $this->error['phone'];
			} else {
				$output['error_phone'] = '';
			}
			
			if (isset($this->error['email'])) {
				$output['error_email'] = $this->error['email'];
			} else {
				$output['error_email'] = '';
			}
			
			if (isset($this->error['enquiry'])) {
				$output['error_enquiry'] = $this->error['enquiry'];
			} else {
				$output['error_enquiry'] = '';
			}
			
			if (isset($this->error['captcha'])) {
				$output['error_captcha'] = $this->error['captcha'];
			} else {
				$output['error_captcha'] = '';
			}
			
			if (isset($this->error['required'])) {
				$output['error_required'] = $this->error['required'];
			} else {
				$output['error_required'] = '';
			}
			
		}
		//$this->response->setOutput($output, $this->config->get('config_compression'));
		
		
		echo json_encode($output);
	}
	
	public function success() {
		$this->language->load('module/feedback');
		if ($this->config->get('feedback_settings')) { 
			$settings = $this->config->get('feedback_settings');
		}
		
		if (!isset($settings['settings_success'])) {
			$this->data['text_message'] = $this->language->get('text_message');
		} else {
			$this->data['text_message'] = $settings['settings_success'];
		}
		
		$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['button_continue'] = $this->language->get('button_continue');
		$this->data['continue'] = HTTP_SERVER . 'index.php?route=common/home';
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/success.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/success.tpl';
		} else {
			$this->template = 'default/template/common/success.tpl';
		}
		
		$this->response->setOutput($this->render(TRUE), $this->config->get('config_compression'));
	}
	
	function captcha() {
		
		$rand = time() + (mt_rand(0, time()));
		$ra = mt_rand(1, 10);
		$random = substr($rand, 1, $ra);
		$code = substr(hexdec(md5(date("F j").$random)), 2, 6);
		$this->session->data['pin'][$this->request->get['captcha_id']] = $code;
		
		$image = imagecreatefromjpeg(DIR_SYSTEM."captcha/captcha.jpg");
		$color = imagecolorallocate($image, rand(50, 150), rand(50, 100), rand(50, 150));
		
		imagettftext($image, 14, rand(-3, 3), rand(5, 15), 18, $color, DIR_SYSTEM."captcha/x.ttf", $code);
	
		ob_start();
			imagejpeg($image, "", 100);
			imagedestroy($image);
		$data = base64_encode(ob_get_clean());
		echo $data;
		

	}
	
	private function validate($settings) {
		
		$formsSettings = $this->config->get('feedback_module');
		$thisFormSettings = $formsSettings[$this->request->post['form_id']];
		
		if (!isset($settings['settings_min_phone']) or !is_numeric($settings['settings_min_phone'])) {
			$settings['settings_min_phone'] = 8;
		}
		if (!isset($settings['settings_max_phone']) or !is_numeric($settings['settings_max_phone'])) {
			$settings['settings_max_phone'] = 15;
		}
		if (!isset($settings['settings_min_text']) or !is_numeric($settings['settings_min_text'])) {
			$settings['settings_min_text'] = 10;
		}
		if (!isset($settings['settings_max_text']) or !is_numeric($settings['settings_max_text'])) {
			$settings['settings_max_text'] = 400;
		}
		
		if (!isset($formsSettings[$this->request->post['form_id']]) 
			or empty($formsSettings[$this->request->post['form_id']]) 
			or !isset($formsSettings[$this->request->post['form_id']]['r'])
			or empty($formsSettings[$this->request->post['form_id']]['r']) 
			or !is_array($formsSettings[$this->request->post['form_id']]['r'])) {
			$this->error['required'] = "SYSTEM ERROR!\r\nAt least one field must be required!\r\nStore admin must re-config this form";
			return false;
		} else {
			$required_fields = $formsSettings[$this->request->post['form_id']]['r'];
		}
		
		
		
		if (array_key_exists ('name', $required_fields) and ((strlen(utf8_decode($this->request->post['wsf_name'])) < 3) || (strlen(utf8_decode($this->request->post['wsf_name'])) > 32))) {
			$this->error['name'] = $this->language->get('error_name');
		}
		
		if (array_key_exists ('phone', $required_fields) and preg_match("/[^0-9-\+]/", $this->request->post['wsf_phone'])) {
			$this->error['phone'] = $this->language->get('error_phone');
		}
		
		if (array_key_exists ('phone', $required_fields) and ((strlen(utf8_decode($this->request->post['wsf_phone'])) < $settings['settings_min_phone']) || (strlen(utf8_decode($this->request->post['wsf_phone'])) > $settings['settings_max_phone']))) {
				$this->error['phone'] = sprintf($this->language->get('error_phone2'), $settings['settings_min_phone'], $settings['settings_max_phone']);
		}
		
		/*
		$pattern = '/^[A-Z0-9._%-+]+@[A-Z0-9][A-Z0-9.-]{0,61}[A-Z0-9]\.[A-Z]{2,6}$/i';
		
		if (!preg_match($pattern, $this->request->post['wsf_email'])) {
			$this->error['email'] = $this->language->get('error_email');
		}
		*/
		
		// !$this->filter_string($this->request->post['wsf_email'], "2")
		
		if (array_key_exists ('email', $required_fields) and (strpos($this->request->post['wsf_email'], '@') === false)) {
			$this->error['email'] = $this->language->get('error_email');
		}
		
		if (array_key_exists ('text', $required_fields) and ((strlen(utf8_decode($this->request->post['wsf_enquiry'])) < $settings['settings_min_text']) || (strlen(utf8_decode($this->request->post['wsf_enquiry']))) > $settings['settings_max_text'])) {
			$this->error['enquiry'] = sprintf($this->language->get('error_enquiry'), $settings['settings_min_text'], $settings['settings_max_text']);
		}
		
		
		if (isset($formsSettings[$this->request->post['form_id']]['captcha']) and ($this->check_captcha() === false)) {
			$this->error['captcha'] = $this->language->get('error_captcha');
		}
		
		if (!$this->error) {
			return TRUE;
		} else {
			return FALSE;
		}
	}
	
	/*=============================================
	| If you want to validate an email in one line, use filter_var() function !
	| http://fr.php.net/manual/en/function.filter-var.php
	|
	| easy use, as described in the document example :
	| var_dump(filter_var('bob@example.com', FILTER_VALIDATE_EMAIL));
	|=============================================*/
	public function filter_string($string="", $filter="2") {
		//var_dump(filter_var($email, FILTER_VALIDATE_EMAIL));
		
		$filters["1"] = FILTER_VALIDATE_INT;
		$filters["2"] = FILTER_VALIDATE_EMAIL;
		$filters["0"] = FILTER_VALIDATE_BOOLEAN;
		
		$res = filter_var($string, $filters["".$filter.""]);
		
		return($res);
	}
}
?>
