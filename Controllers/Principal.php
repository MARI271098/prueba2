<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;
//Load Composer's autoloader
require 'vendor/autoload.php';
class Principal extends Controller
{
    public function __construct()
    {
        parent::__construct();
        session_start();
    }
    public function index()
    {
        $data['title'] = 'Iniciar sesión';
        $this->views->getView('principal', 'index', $data);
    }

    ### LOGIN ###
    public function validar()
    {
        $correo = $_POST['correo'];
        $clave = $_POST['clave'];
        $data = $this->model->getUsuario($correo);
        if (!empty($data)) { //Aqui se comprueba si tenemos algun dato con ese correo electronico //usamos !emty (si existe algo dentro de la variable data)
            if (password_verify($clave, $data['clave'])) { //usamos la funcion password_verify que recibe como parametro un string, $clave el otro seria un hash, ese hash se recupera de la variable data del campo clave 
                $_SESSION['id'] = $data['id'];
                $_SESSION['correo'] = $data['correo'];
                $_SESSION['nombre'] = $data['nombre'];
                $res = array('tipo' => 'success', 'mensaje' => 'BIENVENIDO AL SISTEMA DE GESTOR DE ARCHIVOS DE CGTMA');
            } else {
                $res = array('tipo' => 'warning', 'mensaje' => 'LA CONTRASEÑA INCORRECTA');
            }
        } else {
            $res = array('tipo' => 'warning', 'mensaje' => 'EL CORREO NO EXISTE');
        }

        echo json_encode($res, JSON_UNESCAPED_UNICODE);
        die();
    }

    ## RESETEAR CLAVE
    public function enviarCorreo($correo)
    {
        $consulta = $this->model->getUsuario($correo);
        if (!empty($consulta)) {
            $mail = new PHPMailer(true);
            try {
                $token = md5(date('YmdHis'));
                $this->model->updateToken($token, $correo);
                //Server settings
                $mail->SMTPDebug = 0;                               //Habilitar salida de depuración detallada
                $mail->isSMTP();                                            //Enviar usando SMTP // (SMTP) es un protocolo TCP/IP que se utiliza para enviar y recibir correo electrónico
                $mail->Host       = HOST_SMTP;                     //Configure el servidor SMTP para enviar a través de
                $mail->SMTPAuth   = true;                                   //Habilitar la autenticación SMTP
                $mail->Username   = USER_SMTP;                     //SMTP username
                $mail->Password   = CLAVE_SMTP;                               //SMTP password
                $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;            //Habilitar el cifrado TLS implícito // PHPMailer es una clase creada específicamente para hacer sencillo el envío de emails que tienen características complejas
                $mail->Port       = PUERTO_SMTP;                                    //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`
                                    //cifrado SSL (capa de sockets seguros)
                                    // y su más moderno y seguro sucesor TLS (seguridad de la capa de transporte)
                                    // protegen los datos enviados a través de Internet o de una red informática
                //Recipients
                $mail->setFrom(CORREO_FROM, TITLE);
                $mail->addAddress($correo);

                //Content
                $mail->isHTML(true);                                  //Set email format to HTML
                $mail->Subject = 'Restablecer clave';
                $mail->Body    = 'has pedido restablecer tu contraseña, si no has sido tu omite este mensaje <br><a href="' . BASE_URL . 'principal/reset/' . $token . '">CLICK AQUI PARA CAMBIAR</a>';

                $mail->send();
                $res = array('tipo' => 'success', 'mensaje' => 'CORREO ENVIADO CON UN TOKEN DE SEGURIDAD');
            } catch (Exception $e) {
                $res = array('tipo' => 'success', 'mensaje' => $mail->ErrorInfo);
            }
        } else {
            $res = array('tipo' => 'warning', 'mensaje' => 'EL CORREO NO EXISTE');
        }
        echo json_encode($res, JSON_UNESCAPED_UNICODE);
        die();
    }

    public function reset($token)
    {
        $data['title'] = 'Restablecer clave';
        $data['usuario'] = $this->model->getToken($token);
        if ($data['usuario']['token'] == $token) {
            $this->views->getView('principal', 'reset', $data);
        } else {
            header('Location: ' . BASE_URL . 'errors');
        }
    }

    public function cambiarPass()
    {
        $nueva = $_POST['clave_nueva'];
        $confirmar = $_POST['clave_confirmar'];
        $token = $_POST['token'];
        if (empty($nueva) || empty($confirmar) || empty($confirmar)) {
            $res = array('tipo' => 'warning', 'mensaje' => 'TODO LOS CAMPOS SON REQUERIDOS');
        } else {
            if ($nueva != $confirmar) {
                $res = array('tipo' => 'warning', 'mensaje' => 'LAS CONTRASEÑAS NO COINCIDEN');
            } else {
                $result = $this->model->getToken($token);
                if ($token == $result['token']) {
                    $hash = password_hash($nueva, PASSWORD_DEFAULT);
                    $data = $this->model->cambiarPass($hash, $token);
                    if ($data == 1) {
                        $res = array('tipo' => 'success', 'mensaje' => 'CONTRASEÑA RESTABLECIDA');
                    } else {
                        $res = array('tipo' => 'error', 'mensaje' => 'ERROR AL RESTABLECER LAS CONTRASEÑA');
                    }
                }
            }
        }
        echo json_encode($res, JSON_UNESCAPED_UNICODE);
        die();
    }
}
