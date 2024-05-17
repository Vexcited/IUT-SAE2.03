# SAE2.03 : Installation de services réseau (Sujet 2)

## Compétence (3)

**Administrer des systèmes informatiques communicants complexes**, avec les composantes essentielles suivantes :

- En maitrisant l'architecture des sytèmes et des réseaux
- En sécurisant le système d'information
- En appliquant les obligations légales, les normes en vigueur et les bonnes pratiques
- En mettant en oeuvre les mesures correctives adaptées à la nature des incidents identifiés
- En respectant les contraintes de performances, de coûts et d'efficacité énergétique
- En assurant la pérennité des données et des logiciels

## Contexte

Une entreprise qui fait un développement possède une plage publiqe d'adresses IP assez petite : **164.81.118.0/24**.
Cette plage est déjà configurée dans l'entreprise (elle correspond en réalité à une sous-plage d'adresses de notre infrastructure à l'Université de Limoges).
Vous n'aurez aucune modification à faire à cette configuration, vous la prenez telle-quelle.
Par contre, ce que vous allez devoir configurer est une infrastructure interne privée, qui sera liée à cette plage publique.

Comme l'entreprise est en pleine expansion, elle aura besoin de mettre en place une **zone personnel** pour ses développeurs et une **zone clients** qui permettra l'accès des clients au réseau lorsqu'ils visitent l'entreprise.
L'entreprise choisit d'utiliser une plage privée : P1.P2.P3.P4/n1 (**172.16.192.0/21**), qui sera divisée tel que :

- (au minimum) **950** adresses machine seront utilisées dabs la **zone personnel**
- (au minimum) **350** adresses machine seront utilisées dans la **zone clients**

En plus, l'entreprise aura besoin de 2 plages d'adresses privées supplémentaires (que vuos allez devoir choisir vous-mêmes, en argumentant vos choix) :

- Une sous-plage d'adresses qui connecte les routeurs
- Une plage d'adresses de taille au moins 10 pour la "zone serveurs" qui contient les serveurs de l'entreprise

Avant d'être déployée, la configuration sera émulée et testée dans un outil dédié, pour s'assurer de son bon fonctionnement. Cet outil d'émulation est Kathara.

![Figure 1 : L'architecture à haut niveau](./assets/architecture_high_level.png)

L'entreprise envisage d'utiliser l'architecture représentée dans cette figure. Votre machine physique sera la machine M, dans laquelle une machine virtuelle Kathara (notée VM dans la figure) sera active. La machine M a des adresses IP et du routage configurés.

Dans le rectangle vert-clair à droite de l'image, vous aurez l'architecture qui doit se trouver dans un lab Kathara, situé dans la VM Kathara. Le routeur R0, qui vou permet d'accèder à l'Internet sur la machine M, est également configuré.

Finalement, le routeur R est celui qui fait le lien entre la VM Kathara et l'infrastructure émulée de l'entreprise.

Dans cette SAE, votre but sera de tester l'architecture envisagée par l'entreprise.

![Figure 2 : L'architecture plus en détail](./assets/architecture_details.png)

Dans la zone "serveurs" (zone supérieure) il y a 2 machines :
- Un serveur `sf` dont l'adresse IP sera la **première adresse de la plage choisie** pour la zone "serveurs" ;
- Un routeur `r_s` qui aura deux interfaces réseau, l'une liée au routeur `r`, l'autre liée à la zone "serveurs", avec la **dernière adresse de la plage dédiée** à cette zone.

Dans la zone "personnel" (zone au milieu) il y a 3 machines :
- 2 machines utilisateur, `pca` et `pcb`, dont les adresses IP seront les **deux premières adresses de la plage dédiée** à la zone "personnel" ;
- Un routeur `r_p`, qui aura deux interfaces réseau, l'une liée au routeur `r`, l'autre liée à la zone "personnel", avec une adresse IP qui sera la **dernière de la plage dédiée** de cette zone-là.

Dans la zone "clients" (zone inférieure) il y a 3 machines :
- 2 machines utilisateur, `pcc` et `pcd`, qui doivent recevoir des adresses dynamiquement ;
- Un routeur `r_c`, lié d'un côté au routeur `r` et d'un autre côté avec une adresse constante (**dernière adresse** de la zone "clients"). Du côté client, **cette machine sert aussi de serveur DHCP**, pour l'adressage dynamique. La plage DHCP choisie devra accueillir un nombre de **200** machines.

La personne qui utilise le `pcb` est souvent avec les clients. Elle se rend compte qu'il serait bien de pouvoir manipuler son ordinateur (`pcb`) à distance à partir de la zone "clients". Elle veut de plus pouvoir déposer et retirer des fichiers, à partir de `pcb`, sur un serveur dédié de la zone "serveurs", notamment le serveur `sf`. Le responsable DSI doit donc lui mettre en place des services lui permettant :
- D'établir un tunnel vers `pcb`, qui de plus sera sécurisé ;
- De déposer et retirer des fichiers à partir de `pcb` vers le serveur `sf` de façon sécurisée.

## Questions

### 2.

[Voir le lab.conf](./lab.conf)

### 3.

Dans les `resolv.conf`, on utilise le serveur DNS de [Quad9](https://github.com/Quad9DNS) à la place de ceux de Google ou de Cloudflare.
