# SAE2.03 : Installation de services réseau (Sujet 2)

## Compétence (3)

**Administrer des systèmes informatiques communicants complexes**, avec les composantes essentielles suivantes :

- En maitrisant l'architecture des sytèmes et des réseaux
- En sécurisant le système d'information
- En appliquant les obligations légales
... (TODO)

## Contexte

Une entreprise qui fait un développement possède une plage publiqe d'adresses IP assez petite : **164.81.118.0/24**.
Cette plage est déjà configurée dans l'entreprise (elle correspond en réalité à une sous-plage d'adresses de notre infrastructure à l'Université de Limoges).
Vous n'aurez aucune modification à faire à cette configuration, vous la prenez telle-quelle.
Par contre, ce que vous allez devoir configurer est une infrastructure interne privée, qui sera liée à cette plage publique.

Comme l'entreprise est en pleine expansion, elle aura besoin de mettre en place une **zone personnel** pour ses développeurs et une **zone clients** qui permettra l'accès des clients au réseau lorsqu'ils visitent l'entreprise.
L'entreprise choisit d'utiliser une plage privée : P1.P2.P3.P4/n1 (**172.16.192.0/21**), qui sera divisée tel que :

- (au minimum) **950** adresses machine seront utilisées dabs la **zone personnel**
- (au minimum) **350** adresses machine seront utilisées dans la **zone clients**

En plus, 


## Questions

### 2.

[Voir le lab.conf](./lab.conf)

### 3.

Dans les `resolv.conf`, on utilise le serveur DNS de [Quad9](https://github.com/Quad9DNS) à la place de ceux de Google ou de Cloudflare.
