# Guestbook Helm

Este projeto utiliza como base a aplicação disponibilizada no repositório [https://github.com/diegoep/guestbook](https://github.com/diegoep/guestbook).

## Instruções

Para executar o projeto, siga os passos abaixo:

1. Inicie o Minikube:
    ```bash
    $ minikube start
    ```

2. Configure o ambiente Docker para usar o Minikube:
    ```bash
    $ eval $(minikube docker-env)
    ```

3. Clone o repositório do Guestbook:
    ```bash
    $ git clone https://github.com/diegoep/guestbook
    $ cd guestbook
    ```

4. Construa a imagem Docker do Guestbook:
    ```bash
    $ docker build -t guestbook:1.0.0 .
    ```

5. Habilite o addon Ingress no Minikube:
    ```bash
    $ minikube addons enable ingress
    ```

6. Remova a configuração do webhook de validação:
    ```bash
    $ kubectl delete -A ValidatingWebhookConfiguration ingress-nginx-admission
    ```

7. Clone o repositório do Guestbook Helm:
    ```bash
    $ git clone https://github.com/zeraimundo/guestbook-helm.git
    $ cd guestbook-helm
    ```

8. Dê permissão de execução ao script de deploy:
    ```bash
    $ chmod +x ./deploy.sh
    ```

9. Execute o script de deploy:
    ```bash
    $ ./deploy.sh
    ```
