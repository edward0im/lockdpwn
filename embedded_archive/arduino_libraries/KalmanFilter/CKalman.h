class CKalman
{
private:
	float Q;
    float R;
    float P;
    float X;
    float K;

 public:

    // ù��°���� �Է¹޾� �ʱ�ȭ �Ѵ�. ���������� ����ؼ� ���簪�� �����ؾ� �ϹǷ� �ݵ�� �ϳ��̻��� ���� �ʿ��ϹǷ�~
    CKalman(float initValue)
    {
        X = initValue;
		Q = 0.00001f;
		R = 0.001f;
		P = 1.0f;
    }

	void Init(float v) {X = v;}

    // ���������� �������� ����Ѵ�
    void measurementUpdate()
    {
        K = (P + Q) / (P + Q + R);
        P = R * (P + Q) / (P + Q + R);
    }


    // ���簪�� �޾� ���� ������ �����ϰ� ��ȯ�Ѵ�
    float update(float measurement)
    {
        measurementUpdate();
        X = X + (measurement - X) * K;
        return X;
    }
};
