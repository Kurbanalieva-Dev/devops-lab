resource "aws_security_group" "allow_ssh_http" {
  name        = "allow_traffic"
  description = "Разрешаем доступ для SSH и Web" # Тот самый description, который просил Checkov
  vpc_id      = aws_vpc.main_vpc.id

  # Разрешаем SSH (порт 22) только тебе
  ingress {
    description = "SSH для админа"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["ТВОЙ_IP_ЗДЕСЬ/32"] # Вставь сюда свой реальный IP
  }

  # Разрешаем HTTP (порт 80) всем
  ingress {
    description = "Сайт для всех"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
} 