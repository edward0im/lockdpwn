#ifndef DCMOTOR_MNG_H
#define DCMOTOR_MNG_H

#include <Arduino.h>



//����1 ������
#define MOTOR_PIN1 7
#define MOTOR_PIN2 8

//����2 ������
#define MOTOR_PIN3 9
#define MOTOR_PIN4 10

//����1 pwm��
#define MOTOR_PWM1 5

//����2 pwm��
#define MOTOR_PWM2 6


class CDCMotorDriver
{
protected:
	char m_cPin1;	//����1������, IN1, IN2, ����1�� ���� ���Ͷ� �ϰڽ��ϴ�.
	char m_cPin2;

	char m_cPin3;	//����2 ������, IN3, IN4, ����2�� ���� ���Ͷ� �ϰڽ��ϴ�.
	char m_cPin4;

	char m_cPwm1;	//����1 PWM ������, ENA
	char m_cPwm2;	//����2 PWM ������, ENB

	bool m_bEnablePWM;

public:
	/*
	pwm��� ������� �ʴ°��, pwm1, pwm2���� 0�� bEnablePWM���� false��
	*/
	CDCMotorDriver(int pin1, int pin2, int pin3, int pin4, int pwm1, int pwm2, bool bEnablePWM)
	{
		m_cPin1 = (char)pin1;
		m_cPin2 = (char)pin2;
		m_cPin3 = (char)pin3;
		m_cPin4 = (char)pin4;

		m_cPwm1 = (char)pwm1;
		m_cPwm2 = (char)pwm2;

		m_bEnablePWM = bEnablePWM;
	}

	void Init()
	{
		pinMode(m_cPin1, OUTPUT);
		pinMode(m_cPin2, OUTPUT);
		pinMode(m_cPin3, OUTPUT);
		pinMode(m_cPin4, OUTPUT);
		pinMode(m_cPwm1, OUTPUT);
		pinMode(m_cPwm2, OUTPUT);

		StopAll();
	}

	//�� ���͸� ��ȸ�� �����Ѵ�. 
	//leftspeed : 0 ~ 255������ ������ ���� �ӵ��� ����, pwm��� ���� ������� 0
	//rightspeed : 0 ~ 255������ ������ ���� �ӵ��� ����, pwm��� ���� ������� 0
	void ForwardAll(unsigned char leftspeed, unsigned char rightspeed)
	{
		Forward(true, leftspeed);
		Forward(false, rightspeed);
	}

	//�� ���͸� ���� �ӵ��� ��ȸ�� �����Ѵ�. 
	//leftspeed : 0 ~ 255������ ������ ���� �ӵ��� ����, pwm��� ���� ������� 0
	//rightspeed : 0 ~ 255������ ������ ���� �ӵ��� ����, pwm��� ���� ������� 0
	void BackwardAll(unsigned char leftspeed, unsigned char rightspeed)
	{
		Backward(true, leftspeed);
		Backward(false, rightspeed);
	}

	//��� ���͸� ���� ��Ų��
	void StopAll()
	{
		Stop(true);
		Stop(false);
	}

	//���� ���͸� �ش� �ӵ��� ��ȸ��
	//speed : ���� ����ӵ�, 0 ~ 255, pwm��� ���� ������� 0
	void ForwardLeftMotor(unsigned char speed)
	{
		Forward(true, speed);
	}
	
	//���� ���͸� �ش� �ӵ��� ��ȸ��
	//speed : ���� ����ӵ�, 0 ~ 255, pwm��� ���� ������� 0
	void ForwardRightMotor(unsigned char speed)
	{
		Forward(false, speed);
	}

	//���� ���͸� �ش� �ӵ��� ��ȸ��
	//speed : ���� ����ӵ�, 0 ~ 255, pwm��� ���� ������� 0
	void BackwardLeftMotor(unsigned char speed)
	{
		Backward(true, speed);
	}

	//���� ���͸� �ش� �ӵ��� ��ȸ��
	//speed : ���� ����ӵ�, 0 ~ 255, pwm��� ���� ������� 0
	void BackwardRightMotor(unsigned char speed)
	{
		Backward(false, speed);
	}

	//���� ���͸� ����
	void StopLeft()
	{
		Stop(true);
	}

	//���� ���͸� ����
	void StopRight()
	{
		Stop(false);
	}

	// ���� �Ǵ� ���� ���͸� �ش� �ӵ��� ��ȸ�� �����Ѵ�
	// bMotor1 �� true�ϰ�� ���� ���� false �̸� ��������
	// speed : ���� ����ӵ�, 0 ~ 255, pwm ��� ���� ������� 0
	void Forward(bool bMotor1, unsigned char speed)
	{
		if (bMotor1)
		{
			digitalWrite(m_cPin1, HIGH);
			digitalWrite(m_cPin2, LOW);

			if (m_bEnablePWM)
			{
				if (speed >= 255)
					digitalWrite(m_cPwm1, HIGH);
				else
					analogWrite(m_cPwm1, speed);
			}
		}
		else
		{
			digitalWrite(m_cPin3, HIGH);
			digitalWrite(m_cPin4, LOW);

			if (m_bEnablePWM)
			{
				if (speed >= 255)
					digitalWrite(m_cPwm2, HIGH);
				else
					analogWrite(m_cPwm2, speed);
			}
		}
	}

	//���� �Ǵ� ���� ���͸� �ش� �ӵ��� ��ȸ�� �����Ѵ�
	//bMotor1 �� true�ϰ�� ���� ���� false �̸� ��������
	//speed : ���� ����ӵ�, 0 ~ 255, pwm��� ���� ������� 0
	void Backward(bool bMotor1, unsigned char speed)
	{
		if (bMotor1)
		{
			digitalWrite(m_cPin1, LOW);
			digitalWrite(m_cPin2, HIGH);

			if (m_bEnablePWM)
			{
				if (speed >= 255)
					digitalWrite(m_cPwm1, HIGH);
				else
					analogWrite(m_cPwm1, speed);
			}
		}
		else
		{
			digitalWrite(m_cPin3, LOW);
			digitalWrite(m_cPin4, HIGH);

			if (m_bEnablePWM)
			{
				if (speed >= 255)
					digitalWrite(m_cPwm2, HIGH);
				else
					analogWrite(m_cPwm2, speed);
			}
		}
	}

	//���� �Ǵ� ���� ���͸� ���� ��Ų��
	//bMotor1 �� true�ϰ�� ���� ���� false �̸� ��������
	void Stop(bool bMotor1)
	{
		if (bMotor1)
		{
			digitalWrite(m_cPin1, LOW);
			digitalWrite(m_cPin2, LOW);
		}
		else
		{
			digitalWrite(m_cPin3, LOW);
			digitalWrite(m_cPin4, LOW);
		}
	}
};

/*
CDCMotorDriver g_MotorDriver(MOTOR_PIN1, MOTOR_PIN1, MOTOR_PIN1, MOTOR_PIN1, MOTOR_PWM1, MOTOR_PWM2, true);

void setup()
{
	//�ݵ�� Init�� �ѹ� ȣ���� �ݴϴ�.
	g_MotorDriver.Init();
}

void loop()
{
	//2�ʵ��� �ΰ� ���͸� ��� �ְ� �ӵ��� ��ȸ�� ���� �մϴ�.
	g_MotorDriver.ForwardAll(255, 255);
	delay(2000);

	//2�ʵ��� �ΰ� ���͸� ��� �ְ� �ӵ��� ��ȸ�� ���� �մϴ�.
	g_MotorDriver.BackwardAll(255, 255);
	delay(2000);

	//1�ʵ��� ��� ���͸� ���� ��ŵ�ϴ�.
	g_MotorDriver.StopAll();
	delay(1000);

	//1�ʵ��� ���� ���͸� 1/2�ӵ��� ��ȸ�� ��ŵ�ϴ�.
	g_MotorDriver.ForwardLeftMotor(127);
	delay(1000);

	//1�ʵ��� ���� ���͸� 1/2�ӵ��� ��ȸ�� ��ŵ�ϴ�.
	g_MotorDriver.StopLeft(); //�ϴ� ȸ���ϰ� �ִ� ���� ���ʹ� ���� ��Ű��
	g_MotorDriver.ForwardRightMotor(127);
	delay(1000);

	//2�ʵ��� ������ 1/2�ӵ��� ��ȸ��, ������ �ְ� �ӵ��� ��ȸ����ŵ�ϴ�.
	g_MotorDriver.ForwardLeftMotor(127);
	g_MotorDriver.BackwardRightMotor(255);
	delay(2000);

}*/
#endif
