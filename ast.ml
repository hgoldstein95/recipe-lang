type var = string

type expos = string

type defn =
  | Ingred of var * expos
  | Equip of var * expos

type com =
  | Mix
  | Fold
  | Add of var

type recipe = { title: string;
                defns: defn list;
                steps: (com * expos) list;
              }
