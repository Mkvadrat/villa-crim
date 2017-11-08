<?php
class ControllerCommonHome extends Controller {
	public function index() {
		$this->document->setTitle($this->config->get('config_meta_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));

		if (isset($this->request->get['route'])) {
			$this->document->addLink(HTTP_SERVER, 'canonical');
		}
		
		//Link
		$data['alushta'] = $this->url->link('product/category&path=71');
		$data['vinogradnoye'] = $this->url->link('product/category&path=72');
		$data['zaprudnoye'] = $this->url->link('product/category&path=73');
		$data['izobilnoye'] = $this->url->link('product/category&path=74');
		$data['kiparisnoye'] = $this->url->link('product/category&path=75');
		$data['verkhnyaya_kutuzovka'] = $this->url->link('product/category&path=76');
		$data['nizhnyaya_kutuzovka'] = $this->url->link('product/category&path=77');
		$data['lavrovoye'] = $this->url->link('product/category&path=78');
		$data['lazurnoye'] = $this->url->link('product/category&path=79');
		$data['luchistoye'] = $this->url->link('product/category&path=80');
		$data['malorechenskoye'] = $this->url->link('product/category&path=81');
		$data['malyy_mayak'] = $this->url->link('product/category&path=82');
		$data['partenit'] = $this->url->link('product/category&path=83');
		$data['rozovoye'] = $this->url->link('product/category&path=84');
		$data['rybachye'] = $this->url->link('product/category&path=85');
		$data['semidvorye'] = $this->url->link('product/category&path=86');
		$data['solnechnogorskoye'] = $this->url->link('product/category&path=87');
		$data['yalta'] = $this->url->link('product/category&path=88');
		$data['nikita'] = $this->url->link('product/category&path=91');
		$data['oreanda'] = $this->url->link('product/category&path=92');
		$data['gaspra'] = $this->url->link('product/category&path=93');
		$data['mishor'] = $this->url->link('product/category&path=94');
		$data['livadija'] = $this->url->link('product/category&path=95');
		$data['massandra'] = $this->url->link('product/category&path=96');
		$data['drugiye_rayony'] = $this->url->link('product/category&path=89');		
		
		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);

		foreach ($categories as $category) {
			if ($category['top']) {
				// Level 2
				$children_data = array();

				$children = $this->model_catalog_category->getCategories($category['category_id']);

				foreach ($children as $child) {
					$filter_data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);

					$children_data[] = array(
						'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
						'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
					);
				}

				// Level 1
				$data['categories'][] = array(
					'name'     => $category['name'],
					'children' => $children_data,
					'column'   => $category['column'] ? $category['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
				);
			}
		}
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/home.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/common/home.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/common/home.tpl', $data));
		}
	}
}