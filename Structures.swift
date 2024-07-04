//
//  Structures.swift
//  ApplicationFishy
//
//  Created by Casey on 24/06/2024.
//

import Foundation
import SwiftUI
import MapKit

struct Articles: Identifiable, Hashable {
    var id = UUID()
    var image: String
    var title: String
    var description: String
    var subtitle: String
    var descriptionSuite: String
}

var actu1 = Articles(image: "surpeche",
                     title: "Surpêche, comment préserver l’océan de notre appétit ?",
                     description: """
    Quand on parle des liens entre notre assiette et l’océan, il y a un sujet qui paraît évident : la pêche. Vous vous en doutez, il n’y a pas que ça. Avec notre campagne De l’assiette à l’océan, on explore d’autres sujets comme l’élevage, les intrants chimiques et le transport de marchandises. Mais je ne vais pas tout vous spoiler tout de suite !
    
    Dans cet article, on va creuser les impacts de la pêche. Entre les émissions de gaz à effet de serre, la pollution plastique, la destruction des habitats, les prises accessoires et la surexploitation des ressources, il y a de quoi faire ! Mais que peut-on faire face à ça ? Existe-t-il une pêche durable ? Peut-on continuer à manger du poisson sans détruire l’océan ? C’est à ces questions que l’on tente de répondre ici. À l’abordage !
    """,
                     subtitle: "Le problème\r🌡 L’empreinte carbone",
                     descriptionSuite: """
    Il y a un impact que l’on oublie souvent quand il s’agit de pêche : son empreinte carbone. D’ailleurs, la plupart du temps, elle est sous-estimée. On prend en compte les émissions de gaz à effet de serre liées au fioul consommé par les bateaux de pêche et celles liées au conditionnement et à la chaîne du froid pour que les poissons arrivent en parfait état dans notre assiette. Et généralement, on s’arrête là. Sauf que ce n’est pas si simple…
    
    Quand on calcule l’empreinte carbone de la pêche, on oublie :
    Les émissions de gaz à effet de serre liées à la destruction des fonds marins par les chaluts de fond. En raclant le plancher océanique, le carbone stocké depuis des années sort de l’eau et retourne dans l’atmosphère.
    
    Les émissions de gaz à effet de serre liées à l’extraction des grands poissons. En les pêchant, on rompt le cycle de séquestration du carbone qui passe normalement par leur mort naturelle et leur sédimentation au fond de l’océan.
    
    Un phénomène encore plus important. La pêche déstabilise les écosystèmes et les populations d’espèces, en particulier le phytoplancton et le zooplancton, qui sont de vrais puits de carbone.
    """
)
var actu2 = Articles(image: "manquedeau",
                     title: "Manque d’eau, comment limiter les dégâts ?",
                     description: """
    Après 32 jours sans pluie, les averses sont revenues la semaine dernière… mais elles n’auront pas fait long feu. Et je vous le dis d’emblée : même si j’ai toujours aimé le soleil, ça me fait peur. Très peur, même. À en avoir une boule au ventre. Le mois de février 2023 a été le plus sec jamais enregistré en France depuis 1959. Et c’est d’autant plus inquiétant que le manque de précipitations intervient au moment même où les nappes phréatiques sont censées se recharger pour pouvoir passer l’été sereinement.
    """,
                     subtitle: "Le problème\r💦 La consommation d’eau",
                     descriptionSuite: """
    Chaque année, il pleut en moyenne 500 milliards de mètres cubes d’eau en France métropolitaine selon les données du ministère de la Transition écologique. C’est l’équivalent de plus de 400 fois le volume du lac d’Annecy ! Ça peut paraître énorme vu comme ça, mais 60% de cette eau s’évaporent. Sur les 400 lacs d’Annecy, il n’en reste donc plus que 160. C’est ce que l’on appelle la « pluie efficace ». Autrement dit, l’eau qui alimente les cours d’eau ou les nappes phréatiques.
    
    Pour répondre à tous nos besoins, on en prélève une bonne partie avant de la restituer (et dans quel état ?) aux milieux aquatiques. Le problème, c’est qu’on en perd en cours de route. 16% de l’eau prélevée ne retourne pas dans le cycle de l’eau : c’est “l’eau consommée”. Et presque la moitié de cette eau consommée est liée à… (roulements de tambours 🥁) l’agriculture ! On s’en sert notamment pour alimenter le bétail et irriguer les grandes cultures qui nourrissent le bétail.
    """
)
var actu3 = Articles(image: "elevationmer",
                     title: "Elévation du niveau de la mer, quoi faire?",
                     description: """
    Digues, murets, surélévation des voies de circulation… À La Rochelle, on ne compte plus les constructions qui visent à prévenir les risques liés à la montée des eaux. Et en même temps, ce n’est pas plus mal quand on sait ce qu’il se passe à 15 000 km de là.
    
    Thwaites, ça ne vous dit rien ? C’est le plus gros glacier de l’Antarctique. 120 km de large, 600 km de long et 3 km de profondeur. On le surnomme “le glacier de l’apocalypse”. En décembre dernier, des scientifiques ont tiré la sonnette d’alarme. Sa fonte, et les réactions de causes à effets qu’elle provoquera, pourrait entraîner une élévation du niveau de la mer allant jusqu’à 3 mètres. Le point de non retour est tout proche. S’il est dépassé, on ne pourra plus jamais revenir en arrière. Et bonne journée !
    """,
                     subtitle: "Le problème : la montée des eaux\r🧐 Le constat",
                     descriptionSuite: """
    Le niveau de la mer a augmenté de 20 cm depuis 1900. Ça vous semble peu ? Le problème, c’est que tout s’accélère. Après la publication du dernier rapport du GIEC le 9 août 2021, l’océanographe allemande Karina Von Schukmann a déclaré que le taux de la montée du niveau de la mer n’a jamais été aussi rapide qu’au cours des 100 dernières années.
    
    Alors, à quoi doit-on s’attendre ? Tout dépend de ce qu’il va se passer dans les années à venir. Si l’on réduit nos émissions de gaz à effet de serre pour limiter la hausse des températures à +2°C, le niveau de la mer pourrait monter de 50 cm à 1 mètre en moyenne à l’horizon 2100. À l’inverse, si l’on dépasse les +2°C, le niveau de la mer pourrait monter de plusieurs mètres.
    
    Et chaque centimètre a son importance : un centimètre d’élévation du niveau de la mer, c’est 6 millions de personnes supplémentaires exposées aux inondations côtières autour de la planète.
    """
)
var actu4 = Articles(image: "tournage",
                     title: "Tournage de l’assiette, journal de bord",
                     description: "Clap de fin ! Ça y est, le tournage de la campagne De l’assiette à l’océan arrive à sa fin. Et ce n’est pas trop tôt ! ",
                     subtitle: "🌡 Climat",
                     descriptionSuite: """
    L’océan absorbe 30% des émissions de gaz à effet de serre. 93% de la chaleur produite par le CO2 est captée par l’océan. Sans l’océan, la température moyenne sur la planète serait de 50°C vs. 15°C aujourd’hui. Bref, l’océan régule le climat… mais il commence sérieusement à s’asphyxier.
    
    Plus l’océan absorbe de chaleur et de carbone, plus sa santé se détériore. Voilà, en vrac, quelques conséquences du trop plein d’émissions de gaz à effet de serre dans l’atmosphère : baisse de la capacité de séquestration du dioxyde de carbone, modification des courants marins et stratification de l’eau, désoxygénation, acidification de l’eau, vagues de chaleur sous-marine… et j’en passe !
    
    Les responsables ? Il y en a un paquet, mais notre alimentation est en haut de la liste, juste derrière les transports. 25% de notre empreinte carbone est liée à notre alimentation. Un·e Français·e émet chaque année plus de 2 tonnes de CO2 équivalent rien qu’avec ce qu’iel met dans son assiette. C’est l’objectif à atteindre d’ici 2050 pour la totalité de notre empreinte carbone si on veut limiter l’élévation de la température à +1,5°C par rapport aux niveaux pré-industriels. Bon, ça va être chaud, mais il paraît que c’est encore faisable. 😬
    
    En adoptant une alimentation végétale, on passe de plus de 2 tonnes de CO2 équivalent à 650 kg. Autrement dit, on divise par 3 l’empreinte carbone liée à notre alimentation. Et si on jette un œil aux ordres de grandeur, le plus important n’est pas de manger local, mais bien de manger végétal. En réalité, seuls 10% de l’empreinte carbone globale d’un aliment sont imputables au transport. Pour les 90% restants, ça se joue en amont !
    """
)
var actu5 = Articles(image: "intrantschimiques",
                     title: "Intrants chimiques : un danger pour la terre… et pour l’océan",
                     description: """
    On a tendance à dissocier ce qu’il se passe sur terre de ce qu’il se passe dans l’océan. Pourtant, tout est lié par le cycle de l’eau, du sommet des montagnes jusqu’à l’océan. Ça vous paraît contre-intuitif ? C’est normal. Mais comprendre ça, c’est comprendre que pour préserver l’océan, il est urgent de changer nos habitudes sur terre… à commencer par ce qu’on met dans notre assiette et les pratiques agricoles qui permettent de produire nos aliments.
    
    En France, plus de 58 000 fermes sont engagées en bio, soit 13% des fermes. Sur le papier, on est plutôt bien placé·e·s puisque l’on est au deuxième rang européen. Mais depuis 2 ans, ça se tasse. Après avoir doublé entre 2015 et 2020, les ventes de produits bio enregistrent une première baisse en 2021 et la tendance s’est confirmée en 2022. Pourtant, le bio semble inévitable si l’on veut préserver les sols, les ressources en eau, le climat et la biodiversité.
    """,
                     subtitle: "Le problème\r🌾 L’utilisation des intrants chimiques",
                     descriptionSuite: """
    En France, on a de grandes ambitions… mais on ne se donne pas les moyens de les atteindre. Le gouvernement souhaite réduire l’usage des pesticides de 50% à horizon 2025. On est très loin d’avoir atteint ces objectifs ! Pire, on est même à contre-courant : le recours aux pesticides a augmenté de 25% en 10 ans. Et la plupart des pesticides sont utilisés pour 2 types de production agricole : les grandes cultures à 70% et la vigne à 14%. On sait par où commencer pour tenter d’atteindre nos objectifs !
    
    Quand on sait ça, on comprend bien le rôle essentiel de l’océan dans la régulation du climat… et l’urgence de réduire notre empreinte carbone !
    """
)
var info1 = Articles(
    image: "ocean", title: "Comment limiter l'acidification des océans?",
    description: "Quand il s’agit de préservation de l’océan, c’est à terre que (presque) tout se joue. C’est tellement contre-intuitif qu’on le répète encore et encore. Et pour mieux saisir les enjeux, il y a un concept clé à connaître : l’acidification de l’océan. On vous explique.",
    subtitle: "Le problème. \r🍋 L'acidification des océans",
    descriptionSuite: """
Vous vous souvenez de vos cours de physique-chimie du collège ? Pour moi, c’est déjà loin, alors je me suis dit qu’un petit rappel ne ferait pas de mal ! Toutes les solutions aqueuses ont un pH ou potentiel hydrogène. Celui-ci sert à mesurer l’acidité ou la basicité d’une solution. Le pH peut aller de 0 à 14. À 7, le pH est neutre. Ce qui est au-dessus de 7 est basique et ce qui est en dessous de 7 est acide. Maintenant qu’on a mis les choses à plat, place au constat sur le pH de l’océan. Entre 1850 et 2015, le pH moyen en surface est passé de 8,2 à 8,1. -0,1. L’évolution peut paraître insignifiante, mais les apparences sont trompeuses ! En fait, l’échelle du pH est logarithmique. En clair, ça signifie qu’en moins de 200 ans, on a une hausse de 30% de l’acidité de l’océan. C’est énorme !
""")
var info2 = Articles(image: "containers", title: "Transport de marchandises, quel impact?", description: """
        Et si l’on pouvait voyager à l’autre bout de la planète sans monter dans un avion ni passer des semaines dans un train ? Ça n’a rien de futuriste : il n’y a qu’à aller au supermarché du coin. Pendant notre aventure en stop à sillonner les routes de France, on a fait quelques milliers de kilomètres en 3 mois. Mais nos aliments, eux, peuvent faire des milliers de kilomètres en seulement 3 jours. La plupart du temps, ils sont transportés en bateau, mais aussi très souvent en camion et, bien plus rarement, en avion. Si je vous dis tout ça, vous vous en doutez, c’est parce que ce n’est pas sans conséquences pour l’océan.
        """,
                     subtitle: "Le problème\r🌡 L’empreinte carbone",
                     descriptionSuite: """
        En fonction du nombre de kilomètres parcourus par nos aliments, l’empreinte carbone des transports représente une part plus ou moins importante de l’empreinte carbone totale. On parle beaucoup du transport aérien et routier, mais il faut savoir qu’aujourd’hui, 90% du fret mondial est transporté par bateau. La bonne nouvelle pour le climat, c’est que le chargement d’un seul bateau représenterait 60 camions sur les routes. Comme on met beaucoup de marchandises dans un bateau, l’empreinte carbone ramenée à la tonne de marchandises est assez basse. Résultat ? 10 000 km en cargo émettent autant de CO2 que 1 000 km en camion. Mais le problème, c’est qu’il n’y a pas que les émissions de gaz à effet de serre qui impactent l’océan.
        """
)
var info3 = Articles(image: "vache", title: "Élevage : peut-on manger sans abîmer l’océan ?",
                     description: """
        La pêche, c’est souvent le seul sujet auquel la plupart des gens que l’on a croisé·e·s sur la route du tournage De l’assiette à l’océan pensaient quand on leur présentait le projet de notre campagne. Pourtant, même si c’est le plus évident, c’est loin d’être le seul !
        
        Alors après vous avoir parlé de pêche, il est temps de s’intéresser à l’élevage et ses impacts sur l’océan. Ce n’est pas d’aquaculture dont il s’agit ici (je garde ça bien au chaud pour plus tard), mais bien d’élevage d’animaux sur la terre ferme. En France, la consommation de viande par personne a été multipliée par 4 depuis les années 1 800… et ce n’est pas sans conséquences pour le grand bleu. Je vous dis tout !
        """,
                     subtitle: "🌡 L’empreinte carbone",
                     descriptionSuite: """
        Selon l’Organisation des Nations unies pour l’alimentation et l’agriculture aka FAO, l’élevage est responsable de 14,5% des émissions de gaz à effet de serre mondiales. C’est plus que l’ensemble des transports réunis ! En cause : le méthane émis par les ruminants lors de leur digestion, mais aussi le dioxyde de carbone causé par la déforestation et le protoxyde d’azote émis par les engrais azotés utilisés pour produire la nourriture des animaux.
        
        Et l’océan dans tout ça ? En fait, plus on émet de gaz à effet de serre comme le méthane, le dioxyde de carbone ou le protoxyde d’azote, plus on dérègle la grande machine océan.
        
        Il y a 2 chiffres qui devraient vous aider à y voir plus clair :
        
        90% de la chaleur qui ne part pas vers l’espace est absorbée par l’océan, ce qui participe à déséquilibrer les écosystèmes et entraîne des pertes d’oxygène en profondeur. Celles-ci peuvent vider des régions océaniques entières de leurs habitants, transformant durablement les chaînes alimentaires marines et augmentant les risques de surpêche.
        
        30% des émissions de gaz à effet de serre sont captées par l’océan, ce qui contribue à l’acidification de l’océan et une perte de biodiversité marine. Donc plus on émet de gaz à effet de serre, plus l’océan s’acidifie et plus la biodiversité marine est en danger.
        
        Quand on sait ça, on comprend bien le rôle essentiel de l’océan dans la régulation du climat… et l’urgence de réduire notre empreinte carbone !
        """
        )
var info4 = Articles(image: "chlordecone", title: "Chlordécone aux Antilles : un scandale étouffé",
                     description: """
        "Cette bande-dessinée, c’est Tropiques toxiques. En la lisant, j’ai découvert avec stupéfaction comment le gouvernement français a laissé la population s’empoisonner avec le chlordécone. Entre 1972 et 1993, on a arrosé légalement les bananeraies de cet insecticide utilisé pour lutter contre le charançon sur les cultures de bananes antillaises. C’est un insecte ravageur dont les larves se nichent à l’intérieur du bulbe du bananier et peuvent finir par faire tomber son tronc. Pour éviter ça, le chlordécone était présenté comme un produit miracle, alors même que sa toxicité avait déjà été démontrée !
            Comment j’ai pu passer à côté de ça ?
        """,
                     subtitle: "Le problème\r💧 Un scandale environnemental ",
                     descriptionSuite: """
        Le chlordécone fait partie des pesticides organochlorés persistants. Il est si stable chimiquement qu’il peut rester jusqu’à 700 ans dans l’environnement. Aujourd’hui, on en retrouve absolument partout : des sols aux sédiments, en passant par les eaux de surface des cours d’eau et des zones marines, sans oublier les organismes qui y vivent.
        
        À ce jour, les conséquences pour la biodiversité terrestre et marine sont encore largement méconnues. Des travaux de laboratoire montrent des effets sur la reproduction qui pourraient impacter les populations sauvages. Même si ça n’a pas encore été prouvé scientifiquement, on se doute que ce ne sera probablement pas très réjouissant. Et c’est d’autant plus grave que le chlordécone vient s’ajouter à un tas d’autres polluants présents dans l’environnement et pourrait participer à un effet cocktail explosif.
        """
)


// Each recipe has the below structure
struct Recipe: Identifiable, Hashable {
    var id = UUID()
    var image: String
    var title: String
    var time: String
    var servings: Int
    var rating: Int
    var ingredients: [Ingredient] // Each ingredient has a structure below, a name and a quantity
    var directions: [String] // Directions are an array
}

struct Ingredients: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var quantity: Int
}

var recipe1 = Recipe(
    image: "blanquettedelotte",
    title: "Blanquette de lotte",
    time: "20 mins",
    servings: 4,
    rating: 5,
    ingredients: [
        Ingredient(name: "Filet de lotte parée", quantity: "800 g"),
        Ingredient(name: "Moules", quantity: "0.5 l"),
        Ingredient(name: "Champignons de Paris", quantity: "150 g"),
        Ingredient(name: "Echalotes", quantity: "2"),
        Ingredient(name: "Petit blanc de poireau", quantity: "1"),
        Ingredient(name: "Beurre", quantity: "40 g"),
        Ingredient(name: "Farine", quantity: "30 g"),
        Ingredient(name: "Vin blanc sec", quantity: "15 cl"),
        Ingredient(name: "Fumet de poisson", quantity: "20 cl"),
        Ingredient(name: "Jaune d'oeuf", quantity: "1"),
        Ingredient(name: "Crème fraîche", quantity: "150 g"),
        Ingredient(name: "Citron", quantity: "1"),
        Ingredient(name: "Sel", quantity: "1 c.a.c."),
        Ingredient(name: "Poivre", quantity: "1 c.a.c.")
    ],
    directions: [
        """
Nettoyez les moules. Lavez et coupez les champignons en lamelles. Émincez le blanc de poireau. Pelez les carottes et détaillez-les en bâtonnets. Pelez et hachez les échalotes.
""",
        """
Coupez la lotte en morceaux de 50 g. Faites-les revenir dans une cocotte, sans laisser dorer, avec le beurre fondu. Ajoutez les champignons, les échalotes, les carottes et le poireau. Faites suer 2 min. Saupoudrez de farine et mélangez délicatement. Mouillez avec le vin blanc et le fumet. Ajoutez les moules. Salez, poivrez. Couvrez puis laissez cuire 10 min à frémissements.
""",
        """
Fouettez la crème, le jaune d'œuf et le jus de citron. Ajoutez en remuant une louche de jus de cuisson de la lotte. Versez dans la cocotte et mélangez jusqu'à ce que la sauce épaississe. Servez la blanquette de lotte dans un plat creux éventuellement accompagnée d’un riz blanc.
""",
    ]
)
var recipe2 = Recipe(
    image: "parmentierdedorade",
    title: "Parmentier de dorade",
    time: "60 mins",
    servings: 4,
    rating: 4,
    ingredients: [
        Ingredient(name: "Filets de dorade", quantity: "500 g"),
        Ingredient(name: "Pommes de terre", quantity: "1 kg"),
        Ingredient(name: "Crème liquide", quantity: "30 cl"),
        Ingredient(name: "Beurre", quantity: "30 g"),
        Ingredient(name: "Emmental râpé", quantity: "à goût"),
        Ingredient(name: "Ail", quantity: "2 gousses"),
        Ingredient(name: "Sel et poivre", quantity: "à goût"),
    ],
    directions: [
        """
Épluchez les pommes de terre, lavez-les, puis coupez-les en morceaux. Plongez-les dans l'eau dans une grande casserole et faites-les cuire environ 25 min (vérifiez la cuisson à l'aide de la pointe d'un couteau).
""",
        """
Faites fondre le beurre dans une grande casserole, ajoutez les pommes de terre en morceaux, l’ail, le persil, du sel et du poivre. Versez la crème et les filets de dorades et couvrez. Laissez cuire 5 à 6minutes.
""",
        """
Faites chauffer le four en mode grill.
""",
        """
Écrasez à l'aide d'un écrase pommes de terre ou d'une fourchette, puis mélangez. Mettre le tout dans un plat et parsemez d'emmental. Enfournez 15 minutes.
"""
    ]
)
var recipe3 = Recipe(
    image: "cevichedecrevettes",
    title: "Ceviche de crevettes",
    time: "25 mins",
    servings: 3,
    rating: 3,
    ingredients: [
        Ingredient(name: "Crevettes cuites surgelées", quantity: "400 g"),
        Ingredient(name: "Tomate", quantity: "1"),
        Ingredient(name: "Onions", quantity: "3"),
        Ingredient(name: "Ketchup", quantity: "1 c.c."),
        Ingredient(name: "Coriandre", quantity: "1 c.c."),
        Ingredient(name: "Piment de cayenne", quantity: "1 c.c."),
        Ingredient(name: "Savora", quantity: "1 c.c."),
        Ingredient(name: "Citrons", quantity: "5"),
        Ingredient(name: "Sel", quantity: "à goût"),
        
    ],
    directions: [
        """
Plonger les crevettes dans de l'eau bouillante quelques secondes pour les décongeler puis les laisser égoutter dans une passoire.
""",
        """
Couper grossièrement la tomate et la mixer. Ajouter le ketchup, la moutarde et la coriandre.
""",
        """
Faire cuire les oignons coupés en rondelles dans le jus de 2 citrons puis mixer et mélanger à la préparation.
""",
        """
Presser les 3 citrons restant et les verser sur les crevettes. Laisser reposer 5 à 10 min puis verser dans la préparation.
""",
        """
Ajouter sel et piment selon votre goût.
""",
        """
Mettre au frigo et servir très frais dans des assiettes à soupe.
"""
    ]
)
var recipe4 = Recipe(
    image: "raviolesdetacaud",
    title: "Raviole de tacaud",
    time: "1h 30",
    servings: 4,
    rating: 5,
    ingredients: [
        Ingredient(name: "Farine", quantity: "250 g"),
        Ingredient(name: "Jaune d'oeuf", quantity: "200 g"),
        Ingredient(name: "Tacaud", quantity: "400 g"),
        Ingredient(name: "Lard fumé", quantity: "50 g"),
        Ingredient(name: "Botte de ciboulette", quantity: "1"),
        Ingredient(name: "Beurre", quantity: "20 g"),
        Ingredient(name: "Cresson", quantity: "2 bottes"),
        Ingredient(name: "Blanc de poireau", quantity: "50 g"),
        Ingredient(name: "Citron confit", quantity: "1"),
        Ingredient(name: "Jaune d'oeuf", quantity: "200 g"),
        Ingredient(name: "Jus de volaille", quantity: "10 cl"),
        Ingredient(name: "Crème liquide", quantity: "80 cl"),
    ],
    directions: [
        """
Pétrir la farine avec le jaune d’œuf et le sel. Réserver au frais dans du papier film pendant 1 heure.
""",
        """
Hacher au couteau le filet de tacaud, ajouter la ciboulette ciselée, le lard haché, le jaune d’œuf et le paprika fumé. Il est fortement conseillé de ne pas ajouter de sel et poivre.
""",
        """
Abaisser la pâte au laminoir et déposer la farce. Façonner les ravioles.
""",
        """
Laver et trier ensuite le cresson: les queues d'un côté, les feuilles de l'autre. Tailler les oignons et le blanc de poireau en petits dés puis les faire fondre au beurre. Ajouter les queues de cresson, et cuire le tout pendant 5 minutes.
""",
        """
Mouiller avec le jus de volaille et la crème. Laisser cuire pendant 20 minutes. Mixer et passer au filtre.
Blanchir les feuilles de cresson quelques minutes puis les ajouter dans le velouté, avec la peau du citron confit. Mixer le tout.
""",
        """
Cuire les ravioles dans de l’eau salée frémissante avec un cube de bouillon de légumes.
Servir le tout avec le velouté chaud.
"""
    ]
)

var recipe5 = Recipe(
    image: "encornetsalaioli",
    title: "Encornets à l'aioli",
    time: "30 min",
    servings: 6,
    rating: 4,
    ingredients: [
        Ingredient(name: "Encornets", quantity: "1,5 kg"),
        Ingredient(name: "Pommes de terre ferme", quantity: "1,5 kg"),
        Ingredient(name: "Courtbouillon", quantity: "1 sachet"),
        Ingredient(name: "Jaunes d'oeufs", quantity: "2"),
        Ingredient(name: "Gousses d'ail", quantity: "2"),
        Ingredient(name: "Huile d'olive", quantity: "0,5 l"),
        Ingredient(name: "Cresson", quantity: "2 bottes"),
        Ingredient(name: "Sel, poivre", quantity: "à goût"),
    ],
    directions: [
        """
Demandez à votre poissonnier de vous nettoyer les encornets. Lavez-les, coupez-les en lanières. Mettez-les dans une casserole, saupoudrez avec le court-bouillon, mouillez d'eau froide pour recouvrir largement les chairs.
""",
        """
Faites cuire environ 30 mn. Ne prolongez pas la cuisson, car ils durciraient. Faites cuire les pommes de terre à l'anglaise dans de l'eau salée.
""",
        """
Préparez l'aïoli. Dans un mortier, écrasez finement l'ail au presse-ail ou au pilon, mettez les jaunes d'oeufs et montez l'aïoli comme une mayonnaise ordinaire. Si vous trouvez votre sauce trop ferme, assouplissez-la d'une cuillerée à café d'eau.
""",
        """
Servez les pommes de terre et encornets bien égouttés ensemble, présentez l'aïoli à part. Mais vous pouvez tout mélanger comme dans le Midi.
""",

    ]
)

var recipe6 = Recipe(
    image: "calamarssautes",
    title: "Calamars sautés à l'ail",
    time: "15 min",
    servings: 4,
    rating: 5,
    ingredients: [
        Ingredient(name: "Calamars", quantity: "1 kg"),
        Ingredient(name: "Gousses", quantity: "4"),
        Ingredient(name: "Persil", quantity: "1 "),
        Ingredient(name: "Vin blanc", quantity: "5 cl"),
        Ingredient(name: "Huile d'olive", quantity: "3 c.a.s."),
        Ingredient(name: "Sauce soja", quantity: "2 c.a.s."),
        Ingredient(name: "Sel, poivre", quantity: "à goût"),
    ],
    directions: [
        """
Rincez les calamars, épongez-les.
""",
        """
Lavez le persil, égouttez-le, émincez-le finement.
""",
        """
Pelez et hachez l'ail.
""",
        """
Dans un wok, faites chauffer l'huile et versez-y les calamars et parsemez-les d'ail et de persil.
""",
        """
Ajoutez la sauce soja, poivrez et faites cuire 15 mn à feu vif jusqu'à ce que tout le liquide soit évaporé.
""",
        """
Versez le vin blanc, laissez réduire à nouveau pendant 5 mn.
""",
        """
Grattez le fond de la poêle afin de décoller tous les sucs. Servez.
"""

    ]
)

var recipe7 = Recipe(
    image: "rizauxfruitsdemer",
    title: "Riz au fruits de mer",
    time: "30 min",
    servings: 4,
    rating: 4,
    ingredients: [
        Ingredient(name: "Riz blanc cuit", quantity: "1 kg"),
        Ingredient(name: "Moules nettoyées", quantity: "6"),
        Ingredient(name: "Huile d'olive", quantity: "4 c.a.s."),
        Ingredient(name: "Pâte de piment jaune", quantity: "3 c.a.s."),
        Ingredient(name: "Curcuma", quantity: "1 c.a.c."),
        Ingredient(name: "Fumet de poisson", quantity: "75 cl"),
        Ingredient(name: "Patelles hachées", quantity: "4"),
        Ingredient(name: "Crevettes décortiquées", quantity: "12"),
        Ingredient(name: "Noix de saint-jacques", quantity: "12"),
        Ingredient(name: "Palourdes", quantity: "8"),
        Ingredient(name: "Calamar nettoyé et coupé en anneaux", quantity: "200 g"),
    ],
    directions: [
        """
Faites cuire les moules dans de l’eau bouillante pendant 2 mn. Laissez-les tiédir avant de les décoquiller. Réservez.
""",
        """
Faites revenir 2 c. à soupe d’huile, le condiment piment/ail/oignon et la pâte de piments pendant 2 à 3 mn. Toujours sur le feu, ajoutez le curcuma et le riz, salez et poivrez. Mélangez bien.
""",
        """
Versez progressivement le fumet de poisson, puis ajoutez les patelles, les crevettes, les noix de Saint-Jacques, les moules, les palourdes et le calamar.
""",
        """
Faites cuire le tout à feu vif pendant 3 mn en remuant. Incorporez la coriandre, puis versez dans de larges bols peu profonds.
""",
        """
Arrosez d’huile d’olive et servez.
"""
    ]
)
var recipe8 = Recipe(
    image: "saladeharicotscalamar",
    title: "Salade de calamars et chorizo",
    time: "45 min",
    servings: 4,
    rating: 4,
    ingredients: [
        Ingredient(name: "Haricots cocos à ecosser", quantity: "1,2 kg"),
        Ingredient(name: "Calamars nettoyés et coupés en carrés", quantity: "6"),
        Ingredient(name: "Tranches de chorizo", quantity: "12"),
        Ingredient(name: "Oignon épluché", quantity: "1"),
        Ingredient(name: "Clous de girofle", quantity: "2"),
        Ingredient(name: "Bouquet garni", quantity: "1"),
        Ingredient(name: "Oignons nouveaux", quantity: "3"),
        Ingredient(name: "Branches de céleri", quantity: "2"),
        Ingredient(name: "Brins de coriandre", quantity: "6"),
        Ingredient(name: "Pomme verte", quantity: "1"),
        Ingredient(name: "Olives noires", quantity: "3 c.a.s."),
        Ingredient(name: "Sauce citronnette", quantity: "à goût"),
    ],
    directions: [
        """
Faites cuire les haricots avec l’oignon piqué des clous de girofle et le bouquet garni pendant 30 mn. Égouttez. Retirez l’oignon et le bouquet garni. Salez et poivrez.
""",
        """
Rincez les oignons nouveaux, les branches de céleri et la coriandre. Coupez les oignons en lamelles et le céleri en rondelles. Ciselez la coriandre et réservez-la. Pelez la pomme et détaillez-la en bâtonnets. Mélangez les oignons, le céleri et la pomme avec les olives.
""",
        """
Préparez la sauce citronnette. Mélangez tous les ingrédients et versez la sauce sur la salade.
""",
        """
Quadrillez la surface des calamars avec la pointe d’un couteau. Poêlez-les à sec avec les tranches de chorizo 2 mn de chaque côté. Déposez le tout sur la salade. Servez aussitôt, parsemé de coriandre.
"""
    ]
)

struct Ingredient: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let quantity: String
}

struct Pin: Identifiable {
    // @Binding var dissmissModal: Bool
    
    
    var id = UUID()
    
    // Pour le marker
    var icon: String
    var color: Color
    var tag: Int
    
    // Pour la modal
    var image: String
    var name: String
    var address: String
    var coordinates: CLLocationCoordinate2D
    var day1: String
    var day2: String
    var openH: String // Verifier si type Date()
    var closeH: String // Verifier si type Date()
    var note: Int // Nombre d'étoiles
    var tags: String // Comment créer les tags ? C'est un type ? => Mettre dans une énumération
    var like: Bool
    
}

var place: [Pin] = [Pin(
    icon: "fork.knife",
    color: .customOrange,
    tag: 7,
    image: "oyster",
    name: "Oyster Club",
    address: "15 rue de Jouy 75004 Paris",
    coordinates: CLLocationCoordinate2D(latitude: 48.85533073243431, longitude: 2.3578338546736557),
    day1: "Samedi", 
    day2: "Dimanche",
    openH: "11h30",
    closeH: "00h30",
    note: 4,
    tags: "Restaurant",
    like: true
),]


var nvFavori: [Product] = [Product(
    title: "Sardines au Citron & Basilic",
    description: "Description",
    dlist: "Sardines marinade huile et basilic - 140g",
    ingredients: "Ingrédients",
    ilist: "Sardines, eau, citron 3,1%, basilic",
    image: "sardinesProposal",
    chooser: "correct",
    addFavorite : true
)]
