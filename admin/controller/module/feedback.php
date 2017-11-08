<?php
// v 0.3
class ControllerModuleFeedback extends Controller {
	private $error = array();
	
	public function index() {
		$this->load->language('module/feedback');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
			
			$this->model_setting_setting->editSetting('feedback', $this->request->post);
			
			$this->session->data['success'] = $this->language->get('text_success');
			
			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
			
			//$this->redirect(HTTPS_SERVER . 'index.php?route=module/webme_sidebar_feedback&token=' . $this->session->data['token']);
		}
		
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_left'] = $this->language->get('text_left');
		$data['text_right'] = $this->language->get('text_right');
		$data['text_content_top'] = $this->language->get('text_content_top');
		$data['text_content_bottom'] = $this->language->get('text_content_bottom');		
		$data['text_column_left'] = $this->language->get('text_column_left');
		$data['text_column_right'] = $this->language->get('text_column_right');
		$data['button_add_module'] = $this->language->get('button_add_module');
		$data['button_remove'] = $this->language->get('button_remove');
		$data['entry_layout'] = $this->language->get('entry_layout');
		$data['entry_position'] = $this->language->get('entry_position');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$data['entry_fields'] = $this->language->get('entry_fields');
		$data['required_entry_fields'] = $this->language->get('required_entry_fields');
		$data['txt_first_name'] = $this->language->get('txt_first_name');
		$data['txt_email'] = $this->language->get('txt_email');
		$data['txt_phone'] = $this->language->get('txt_phone');
		$data['txt_textarea'] = $this->language->get('txt_textarea');
		$data['txt_captcha'] = $this->language->get('txt_captcha');
		$data['tab_settings'] = $this->language->get('tab_settings');
		$data['tab_modules'] = $this->language->get('tab_modules');
		$data['txt_default'] = $this->language->get('txt_default');
		$data['txt_default_text_message'] = $this->language->get('txt_default_text_message');
		
		$data['txt_settings_min_phone'] = $this->language->get('txt_settings_min_phone');
		$data['txt_settings_max_phone'] = $this->language->get('txt_settings_max_phone');
		$data['txt_settings_min_text'] = $this->language->get('txt_settings_min_text');
		$data['txt_settings_max_text'] = $this->language->get('txt_settings_max_text');
		$data['txt_settings_success'] = $this->language->get('txt_settings_success');
	
		
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		
		$this->load->model('design/layout');
		$data['layouts'] = $this->model_design_layout->getLayouts();
		
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

  		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
			
       		'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
       		'text'      => $this->language->get('text_home'),
      		'separator' => FALSE
   		);

   		$data['breadcrumbs'][] = array(			
       		'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
       		'text'      => $this->language->get('text_module'),
      		'separator' => ' :: '
   		);
		
   		$data['breadcrumbs'][] = array(
       		'href'      => $this->url->link('module/feedback', 'token=' . $this->session->data['token'], 'SSL'),
       		'text'      => $this->language->get('heading_title'),
      		'separator' => ' :: '
   		);
		
		$data['action'] = $this->url->link('module/feedback', 'token=' . $this->session->data['token'], 'SSL');
		
		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		$data['modules'] = array();
		
		if (isset($this->request->post['feedback_module'])) {
			$data['modules'] = $this->request->post['feedback_module'];
		} elseif ($this->config->get('feedback_module')) { 
			$data['modules'] = $this->config->get('feedback_module');
		}
		if (isset($this->request->post['feedback_settings'])) {
			$data['settings'] = $this->request->post['feedback_settings'];
		} elseif ($this->config->get('feedback_settings')) { 
			$data['settings'] = $this->config->get('feedback_settings');
		}
		
		
		

		$data['header'] = $this->load->controller('common/header');
		$data['footer'] = $this->load->controller('common/footer');
		$this->response->setOutput($this->load->view('module/feedback.tpl', $data));
		
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/feedback')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return TRUE;
		} else {
			return FALSE;
		}
	}
}
?>