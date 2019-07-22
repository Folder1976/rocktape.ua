<?php

class ControllerAccountUniversalform extends Controller {
	private $error = array();
	
	public function index() {
    
		//$this->config->set('config_email', 'folder.list@gmail.com');
	    
		$json = array();
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			
            
			$subject = 'Форма обратной связи с сайта - '.HTTP_SERVER;
            $message = '';
            
			
			
            foreach($this->request->post as $name => $value){
                $message  .= $name .': '.$value. "\n\n";
            }
       
       
			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
			$mail->smtp_username = $this->config->get('config_mail_smtp_username');
			$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			$mail->smtp_port = $this->config->get('config_mail_smtp_port');
			$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
			
			if(isset($_FILES["file"]) AND $_FILES["file"]["tmp_name"] !== ''){
				move_uploaded_file($_FILES["file"]["tmp_name"],DIR_UPLOAD.$_FILES["file"]["name"]);
				$mail->AddAttachment( DIR_UPLOAD.$_FILES["file"]["name"] , $_FILES["file"]["name"] );

			}
		
			$mail->setTo($this->config->get('config_email'));
			//$mail->setTo('folder.list@gmail.com');
			$mail->setFrom($this->config->get('config_email'));
			
			$mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
			$mail->setSubject(html_entity_decode($subject, ENT_QUOTES, 'UTF-8'));
			$mail->setText(html_entity_decode($message, ENT_QUOTES, 'UTF-8'));
			$mail->send();
            
            $json['success'] = 'Форма успешно отправлена. Мы скоро свяжемся с Вами.';
		}else{
            $json['error'] = $this->error;
        }

        $this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));

	}

	protected function validate() {
        
		
       if (!isset($this->request->post['seminar_email']) OR $this->request->post['seminar_email'] == '') {
			$this->error = 'Укажите Ваш емаил';
        }
        
       if (!isset($this->request->post['seminar_phone']) OR $this->request->post['seminar_phone'] == '') {
			$this->error = 'Укажите Ваш телефон';
        }
        
		if (!isset($this->request->post['seminar_name']) OR $this->request->post['seminar_name'] == '') {
			$this->error = 'Укажите Ваше имя';
        }


		return !$this->error;
	}
	public function podpiska() {
		
		
		$json = array();
		if (($this->request->server['REQUEST_METHOD'] == 'POST')){ // && $this->validate()) {
			
            
			$subject = $this->request->post['subj'];
            $message = '';
  		
            foreach($this->request->post as $name => $value){
                $message  .= $name .': '.$value. "\n\n";
            }
		
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer WHERE email='".$this->db->escape($this->request->post['email'])."' LIMIT 1");
			
			if($query->num_rows){
				
				$customer_info = $query->row;	
				
				if((int)$customer_info['newsletter'] == 1){
					$json['success'] = 'Данный емаил уже подписан на новости.';
					$is_ok = true;
				}

				$query = $this->db->query("UPDATE " . DB_PREFIX . "customer SET newsletter='1' WHERE email='".$this->db->escape($this->request->post['email'])."'");
				
			}else{
				$query = $this->db->query("INSERT INTO " . DB_PREFIX . "customer
										  SET email='".$this->db->escape($this->request->post['email'])."',
										  firstname='newsletter',
										  lastname='".$this->db->escape($this->request->post['email'])."',
										  newsletter='1'
										  ");
			}
       
			if(!isset($is_ok)){
				$mail = new Mail();
				$mail->protocol = $this->config->get('config_mail_protocol');
				$mail->parameter = $this->config->get('config_mail_parameter');
				$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
				$mail->smtp_username = $this->config->get('config_mail_smtp_username');
				$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
				$mail->smtp_port = $this->config->get('config_mail_smtp_port');
				$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
				
				if(isset($_FILES["file"]) AND $_FILES["file"]["tmp_name"] !== ''){
					move_uploaded_file($_FILES["file"]["tmp_name"],DIR_UPLOAD.$_FILES["file"]["name"]);
					$mail->AddAttachment( DIR_UPLOAD.$_FILES["file"]["name"] , $_FILES["file"]["name"] );
	
				}
			
				$mail->setTo($this->config->get('config_email'));
				//$mail->setTo('folder.list@gmail.com');
				$mail->setFrom($this->config->get('config_email'));
				
				$mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
				$mail->setSubject(html_entity_decode($subject, ENT_QUOTES, 'UTF-8'));
				$mail->setText(html_entity_decode($message, ENT_QUOTES, 'UTF-8'));
				$mail->send();
			
				$json['success'] = 'Спасибо за подписку.';
			}
            
            
		}else{
            $json['error'] = $this->error;
        }

        $this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
	
	
}
