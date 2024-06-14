# Elastic Load Balancer (ELB)

![Illustration](./assets/illustration.png)

## Qu'est-ce que c'est ?

Un __Elastic Load Balancer (ELB)__ joue un rôle crucial dans l'architecture des systèmes distribués en répartissant efficacement le trafic réseau entre plusieurs serveurs. Les principaux objectifs d'un ELB sont :

Optimisation des performances : En distribuant équitablement la charge de travail entre les serveurs, l'ELB améliore les temps de réponse et maximise l'utilisation des ressources disponibles.

Haute disponibilité : En redirigeant le trafic vers des serveurs disponibles et fonctionnels, l'ELB garantit une disponibilité continue de l'application, même en cas de défaillance d'un serveur.

Résilience accrue du système : En surveillant en permanence la santé des serveurs (healthy vs unhealthy), l'ELB peut ajuster dynamiquement la répartition du trafic pour maintenir la stabilité et la résilience du système.

## Concrètement ?
Le load balancer vérifie en continu l'état de santé des serveurs backend. Les serveurs jugés __"healthy"__ reçoivent le trafic utilisateur, tandis que ceux jugés __"unhealthy"__ sont retirés de la rotation du trafic jusqu'à ce qu'ils soient à nouveau opérationnels.

Dans notre projet, nous avons mis en place une infrastructure utilisant quatre conteneurs Docker :

Trois serveurs backend, chacun écoutant sur des ports différents (8081, 8082, 8083).
Un proxy (HAProxy) servant de load balancer, responsable de la distribution du trafic entrant vers ces serveurs backend.
Chaque fois qu'un utilisateur se connecte à l'application, le load balancer dirige automatiquement la requête vers l'un des serveurs backend disponibles. Par exemple :

* 🙍 est dirigé vers le port 8081.
* 🙍‍♀️ est dirigé vers le port 8082.
* 🙍‍♂️ est dirigé vers le port 8083.
Ce processus de répartition de la charge assure une utilisation équilibrée des ressources et une expérience utilisateur stable, même en cas de fluctuations de la demande ou de pannes potentielles des serveurs individuels.