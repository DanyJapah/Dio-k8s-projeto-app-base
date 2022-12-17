echo "Criando as imagens..........."

docker build -t denilsonbanatti/projeto-backend:1.0 backend/.
docker build -t denilsonbanatti/projeto-database:1.0 database/.

echo "Realizando o push das imagens......."

docker push denilsonbanatti/projeto-backend:1.0
docker push denilsonbanatti/projeto-database:1.0

echo "Criando serviços no cluster kubernetes...."

kubectl apply -f ./sevices.yml

echo "Criando os deployments......."

kubectl apply -f ./deployments.yml