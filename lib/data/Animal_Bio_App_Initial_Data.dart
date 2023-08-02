import '../models/App_model.dart';

AnimalsType? selectedAnimalType;

List<AnimalsType> animalTypesList = <AnimalsType>[
  AnimalsType(
    tableName: "Mammals",
    bgImage: "https://a-z-animals.com/media/2021/09/Species-Of-Mammals-header.jpg",
  ),
  AnimalsType(
    tableName: "Birds",
    bgImage: "https://static.toiimg.com/thumb/msid-81645163,width-1280,resizemode-4/81645163.jpg",
  ),
  AnimalsType(
    tableName: "Fish",
    bgImage: "https://stylesatlife.com/wp-content/uploads/2019/10/Types-of-Fish-Species-In-World-and-Their-Facts.jpg",
  ),
  AnimalsType(
    tableName: "Reptiles",
    bgImage: "https://images.squarespace-cdn.com/content/v1/53055e70e4b0bc83a97c7ed1/1585575557740-FXMBZAMYNLFM2ML6XWCP/Marine+Reptiles+2.jpg",
  ),
  AnimalsType(
    tableName: "Amphibians",
    bgImage: "https://animals.sandiegozoo.org/sites/default/files/2016-10/animals_hero_amphibeans.jpg",
  ),
  AnimalsType(
    tableName: "Invertebrates",
    bgImage: "https://npr.brightspotcdn.com/dims4/default/f5a6060/2147483647/strip/true/crop/3500x2333+0+0/resize/880x587!/quality/90/?url=https%3A%2F%2Fnpr.brightspotcdn.com%2F42%2F1a%2F46a57e494331bfc96db751baf18c%2Fjoshua-j-cotten-ho93gvtrww8-unsplash.jpg",
  ),
];


List<Animal> animals = <Animal>[
  Animal(
    name: "Lion",
    description: "The lion (Panthera leo) is a large cat of the genus Panthera native to Africa and India. It has a muscular.",
    image: "https://nationaltoday.com/wp-content/uploads/2021/10/World-Lion-Day-1200x834.jpg",
    type: "Mammals",
  ),
  Animal(
    name: "Dogs",
    description: "The dog or domestic dog is a domesticated descendant of the wolf, and is characterized by an upturning tail.",
    image: "https://images.saymedia-content.com/.image/t_share/MTk2MTcwNDk2NjQ2MDYzMjQ5/why-pitbull-dog-is-banned-in-25-countries.png",
    type: "Mammals",
  ),
  Animal(
    name: "Horse",
    description: "The horse is a domesticated, odd-toed, hoofed mammal. It belongs to the taxonomic family Equidae and is one of two extant subspecies of Equus ferus.",
    image: "https://www.treehugger.com/thmb/kaA2K_9wVzTbPIyCRm3-oZuy6k0=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/horse.primary-e9a47e1c486c4fb7bf729e05b59cf0df.jpg",
    type: "Mammals",
  ),
  Animal(
    name: "Panda",
    description: "The giant panda, also known as the panda bear  is a bear species endemic to China.",
    image: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0f/Grosser_Panda.JPG/1200px-Grosser_Panda.JPG",
    type: "Mammals",
  ),
  Animal(
    name: "Raccoon",
    description: "A raccoon is any of seven species of nocturnal mammals characterized by bushy ringed tails.",
    image: "https://a-z-animals.com/media/2018/09/Raccoon-baby.jpg",
    type: "Mammals",
  ),
  Animal(
    name: "Monkey",
    description: "Monkey is a common name that may refer to most mammals of the infraorder Simiiformes, also known as the simians. Traditionally,",
    image: "https://www.hindustantimes.com/ht-img/img/2023/06/12/1600x900/Forest-guards-and-rangers-will-feed-the-monkeys-at_1686594283025.jpg",
    type: "Mammals",
  ),
  Animal(
    name: "Angelfish",
    description: "Pterophyllum is a small genus of freshwater fish from the family Cichlidae known to most aquarists as angelfish.",
    image: "https://a-z-animals.com/media/2023/04/shutterstock_1156965415-1024x683.jpg",
    type: "Fish",
  ),
  Animal(
    name: "Shark",
    description: "Sharks are a group of elasmobranch fish characterized by a cartilaginous skeleton, five to seven gill slits on the sides of the head",
    image: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/56/White_shark.jpg/800px-White_shark.jpg",
    type: "Fish",
  ),
  Animal(
    name: "Whale",
    description: "Whales are a widely distributed and diverse group of fully aquatic placental marine mammals.",
    image: "https://nationaltoday.com/wp-content/uploads/2021/10/world-whale-day.jpg",
    type: "Fish",
  ),
  Animal(
    name: "Eel",
    description: "Eels are ray-finned fish belonging to the order Anguilliformes, which consists of eight suborders.",
    image: "https://c.files.bbci.co.uk/16760/production/_107000029_tv036084412.jpg",
    type: "Fish",
  ),
  Animal(
    name: "Falcons",
    description: "Falcons are birds of prey in the genus Falco, which includes about 40 species. Falcons are widely distributed on all continents.",
    image: "https://i.natgeofe.com/k/68424626-f7d0-4275-8d50-0450b5800563/peregrine-falcon-wings-extended.jpg",
    type: "Birds",
  ),
  Animal(
    name: "Penguins",
    description: "Penguins are a group of aquatic flightless birds. They live almost exclusively in the Southern Hemisphere",
    image: "https://www.cabq.gov/artsculture/biopark/news/10-cool-facts-about-penguins/@@images/1a36b305-412d-405e-a38b-0947ce6709ba.jpeg",
    type: "Birds",
  ),
  Animal(
    name: "Ducks",
    description: "Duck is the common name for numerous species of waterfowl in the family Anatidae. Ducks are generally smaller.",
    image: "https://st.depositphotos.com/2762064/3735/i/600/depositphotos_37357339-stock-photo-ducks-flying-over-a-lake.jpg",
    type: "Birds",
  ),
  Animal(
    name: "Blackbirds",
    description: "BThe common blackbird is a species of true thrush. It is also called the Eurasian blackbird, or simply the blackbird ",
    image: "https://images.squarespace-cdn.com/content/v1/5fb227922ca67743c748d25a/1625027543292-5RBBB98ZUMSWSM6I6KSV/Blackbird1.jpg",
    type: "Birds",
  ),
  Animal(
    name: "Parrots",
    description: "Parrots, also known as psittacines, are birds of the roughly 398 species in 92 genera comprising the order Psittaciformes.",
    image: "https://cdn.firstcry.com/education/2022/04/29104112/1115777186.jpg",
    type: "Birds",
  ),
  Animal(
    name: "Sparrows",
    description: "he name sparrow is most firmly attached to birds of the Old World family Passeridae, particularly to the house sparrow",
    image: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9b/House_sparrow_male_in_Prospect_Park_%2853532%29.jpg/1200px-House_sparrow_male_in_Prospect_Park_%2853532%29.jpg",
    type: "Birds",
  ),
  Animal(
    name: "Frog",
    description: "A frog is any member of a diverse and largely carnivorous group of short-bodied.",
    image: "https://cdn.britannica.com/73/100273-050-221A0593/arrow-poison-frogs-sound-production-colour-warning-signal.jpg",
    type: "Amphibians",
  ),
  Animal(
    name: "Toad",
    description: "Toad is a common name for certain frogs, especially of the family Bufonidae, that are characterized by dry.",
    image: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Bombina_bombina_1_%28Marek_Szczepanek%29.jpg/640px-Bombina_bombina_1_%28Marek_Szczepanek%29.jpg",
    type: "Amphibians",
  ),
  Animal(
    name: "Caecilian",
    description: "Caecilians are a group of limbless, vermiform or serpentine amphibians.",
    image: "https://www.sciencenews.org/wp-content/uploads/2020/07/070120_cw_caecilian_feat-1028x579.jpg",
    type: "Amphibians",
  ),
  Animal(
    name: "Bee",
    description: "Bees are winged insects closely related to wasps and ants, known for their role in pollination.",
    image: "https://cdn.britannica.com/18/240418-050-38F9D3A5/plasterer-bee-Colletes-daviesanus.jpg",
    type: "Invertebrates",
  ),
  Animal(
    name: "Ant",
    description: "Ants are eusocial insects of the family Formicidae and, along with the related wasps and bees.",
    image: "https://media.nature.com/lw767/magazine-assets/d41586-022-04186-2/d41586-022-04186-2_23768458.jpg",
    type: "Invertebrates",
  ),
  Animal(
    name: "Butterfly",
    description: "Butterflies are insects in the macrolepidopteran clade Rhopalocera from the order Lepidoptera.",
    image: "https://cdn.britannica.com/76/151376-050-13586FE2/monarch-butterfly-flowers-bush.jpg",
    type: "Invertebrates",
  ),
  Animal(
    name: "Snakes",
    description: "Snakes are elongated, limbless, carnivorous reptiles of the suborder Serpentes.",
    image: "https://static.toiimg.com/photo/imgsize-75412,msid-101143981/101143981.jpg",
    type: "Reptiles",
  ),
  Animal(
    name: "Turtles",
    description: "Turtles are an order of reptiles known as Testudines, characterized by a shell developed mainly from their ribs.",
    image: "https://earth.org/wp-content/uploads/2022/06/Untitled-1024-%C3%97-683px-17-1200x675.jpg",
    type: "Reptiles",
  ),
];