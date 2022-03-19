module Deku.Change where

import Prelude

import Data.Symbol (class IsSymbol, reflectSymbol)
import Data.Typelevel.Num (class Lt, class Nat, class Pos, toInt)
import Data.Vec as V
import Deku.Control.Indexed (IxDOM(..))
import Deku.Control.Types (DOM, DOMState', unsafeDOM, unsafeUnDOM)
import Deku.CreateT (class CreateT)
import Deku.Graph.Attribute (Attribute, AttributeValue, unsafeUnAttribute)
import Deku.Graph.DOM (unsafeUnSubgraph, unsafeUnText)
import Deku.Graph.DOM as CTOR
import Deku.Graph.Graph (Graph)
import Deku.Graph.Node (NodeC)
import Deku.Interpret (class DOMInterpret, massiveChange, setAttribute, setSingleSubgraph, setSubgraph, setText, setTumult)
import Deku.Rendered (ToChange(..))
import Deku.Tumult (Tumultuous, safeUntumult)
import Prim.Row (class Cons, class Lacks)
import Prim.Row as R
import Prim.RowList as RL
import Record (get)
import Type.Proxy (Proxy(..))
import Unsafe.Coerce (unsafeCoerce)

type Change'Type (ptr :: Symbol) (a :: Type) (graph :: Graph) =
  forall proxy dom engine proof res
   . DOMInterpret dom engine
  => proxy ptr
  -> DOM dom engine proof res graph a
  -> DOM dom engine proof res graph Unit

-- | Change an dom unit `node` in `igraph` with index `ptr`, outputting the changed node.
class Change' (ptr :: Symbol) (a :: Type) (graph :: Graph) where
  change' :: Change'Type ptr a graph

ichange'
  :: forall proxy ptr a dom engine proof res i
   . DOMInterpret dom engine
  => Change' ptr a i
  => proxy ptr
  -> a
  -> IxDOM dom engine proof res i i Unit
ichange' ptr a = IxDOM (change' ptr <<< (<$) a)

class Change (r :: Row Type) (graph :: Graph) where
  change
    :: forall dom engine proof res
     . DOMInterpret dom engine
    => DOM dom engine proof res graph { | r }
    -> DOM dom engine proof res graph Unit

instance changeAll :: CreateT r () graph => Change r graph where
  change w = o
    where
    { context: i, value } = unsafeUnDOM w
    o =
      unsafeDOM
        { context:
            i
              { instructions = i.instructions <>
                  [ massiveChange { toChange: ToChange $ unsafeCoerce value }
                  ]
              }
        , value: unit
        }

ichange
  :: forall r dom engine proof res inGraph
   . DOMInterpret dom engine
  => Change r inGraph
  => { | r }
  -> IxDOM dom engine proof res inGraph inGraph Unit
ichange r = IxDOM (change <<< (<$) r)

--
class Change_ (r :: Row Type) (graph :: Graph) where
  change_
    :: forall dom engine proof res
     . DOMInterpret dom engine
    => DOM dom engine proof res graph { | r }
    -> DOM dom engine proof res graph Unit

class ChangeRL_ (rl :: RL.RowList Type) (r :: Row Type) (graph :: Graph) where
  changeRL_
    :: forall proxy dom engine proof res
     . DOMInterpret dom engine
    => proxy rl
    -> DOM dom engine proof res graph { | r }
    -> DOM dom engine proof res graph Unit

instance changeRL_Cons :: (IsSymbol key, Cons key val r' r, Lacks key r', Change' key val graph, ChangeRL_ rest r graph) => ChangeRL_ (RL.Cons key val rest) r graph where
  changeRL_ _ w = changeRL_ (Proxy :: _ rest) ((change' (Proxy :: _ key) (w $> (get (Proxy :: _ key) value))) $> value)
    where
    { value } = unsafeUnDOM w

instance changeRL_Nil :: ChangeRL_ RL.Nil r graph where
  changeRL_ _ w = w $> unit


instance change_All :: (RL.RowToList r rl, ChangeRL_ rl r graph) => Change_ r graph where
  change_ = changeRL_ (Proxy :: _ rl)

ichange_
  :: forall r dom engine proof res inGraph
   . DOMInterpret dom engine
  => Change_ r inGraph
  => { | r }
  -> IxDOM dom engine proof res inGraph inGraph Unit
ichange_ r = IxDOM (change_ <<< (<$) r)

instance changeText ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TText edges) ignore graph
  ) =>
  Change' ptr (CTOR.Text) graph where
  change' ptr w = o
    where
    { context: i, value } = unsafeUnDOM w

    id = reflectSymbol ptr

    o =
      unsafeDOM
        { context:
            i
              { instructions = i.instructions <>
                  [ setText { id, text: (unsafeUnText value).text } ]
              }
        , value: unit
        }

instance changeTextString ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TText edges) ignore graph
  ) =>
  Change' ptr String graph where
  change' ptr w = o
    where
    { context: i, value } = unsafeUnDOM w

    id = reflectSymbol ptr

    o =
      unsafeDOM
        { context:
            i
              { instructions = i.instructions <>
                  [ setText { id, text: value } ]
              }
        , value: unit
        }
instance changeRoot ::
  ( R.Cons "root" (NodeC (CTOR.TRoot) edges) ignore graph
  ) =>
  Change' "root" CTOR.Root graph where
  change' _ w = w $> unit

instance changeSubgraph0 ::
  ( IsSymbol ptr
  , IsSymbol terminus
  , R.Cons ptr (NodeC (CTOR.TSubgraph n terminus env) edges) ignore graph
  , Pos n
  ) =>
  Change' ptr (CTOR.Subgraph notImportant (V.Vec n env)) graph where
  change' ptr w = o
    where
    { context: i, value } = unsafeUnDOM w

    id = reflectSymbol ptr

    o =
      unsafeDOM
        { context:
            i
              { instructions = i.instructions <>
                  [ setSubgraph
                      { id
                      , envs: (unsafeUnSubgraph value).envs
                      }
                  ]
              }
        , value: unit
        }

instance changeSubgraph1 ::
  ( IsSymbol ptr
  , IsSymbol terminus
  , R.Cons ptr (NodeC (CTOR.TSubgraph n terminus env) edges) ignore graph
  , Pos n
  , Nat i
  , Lt i n
  ) =>
  Change' ptr (CTOR.XSubgraph i env) graph where
  change' ptr w = o
    where
    { context: i, value: (CTOR.XSubgraph { index, env }) } = unsafeUnDOM w

    id = reflectSymbol ptr

    o =
      unsafeDOM
        { context:
            i
              { instructions = i.instructions <>
                  [ setSingleSubgraph
                      { id
                      , index: toInt index
                      , env
                      }
                  ]
              }
        , value: unit
        }

instance changeTumult ::
  ( IsSymbol ptr
  , IsSymbol terminus
  , Pos n
  , R.Cons ptr (NodeC (CTOR.TTumult n terminus) edges) ignore graph
  ) =>
  Change' ptr (Tumultuous n terminus) graph where
  change' ptr w = o
    where
    { context: i, value } = unsafeUnDOM w
    id = reflectSymbol ptr
    tms = reflectSymbol (Proxy :: _ terminus)
    o =
      unsafeDOM
        { context:
            i
              { instructions = i.instructions <>
                  [ setTumult
                      { id
                      , terminus: tms
                      , instructions: safeUntumult value
                      }
                  ]
              }
        , value: unit
        }

unsafeChange'
  :: forall ptr elt outGraph proxy dom engine proof res
   . DOMInterpret dom engine
  => IsSymbol ptr
  => proxy ptr
  -> DOMState' dom engine res
  -> Array (Attribute elt)
  -> DOM dom engine proof res outGraph Unit
unsafeChange' ptr i attributes = o
  where
  id = reflectSymbol ptr
  o =
    unsafeDOM
      { context:
          i
            { instructions = i.instructions <>
                ( map
                    ( \( { key, value }
                           :: { key :: String
                           , value :: AttributeValue
                           }
                       ) ->
                        setAttribute { id, key, value }
                    )
                    (map unsafeUnAttribute attributes)
                )
            }
      , value: unit
      }

----- codegen
instance changeA ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TA ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.A)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeAbbr ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TAbbr ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Abbr)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeAcronym ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TAcronym ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Acronym)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeAddress ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TAddress ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Address)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeApplet ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TApplet ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Applet)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeArea ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TArea ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Area)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeArticle ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TArticle ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Article)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeAside ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TAside ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Aside)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeAudio ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TAudio ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Audio)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeB ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TB ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.B)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeBase ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TBase ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Base)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeBasefont ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TBasefont ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Basefont)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeBdi ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TBdi ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Bdi)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeBdo ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TBdo ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Bdo)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeBig ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TBig ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Big)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeBlockquote ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TBlockquote ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Blockquote)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeBody ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TBody ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Body)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeBr ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TBr ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Br)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeButton ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TButton ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Button)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeCanvas ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TCanvas ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Canvas)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeCaption ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TCaption ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Caption)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeCenter ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TCenter ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Center)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeCite ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TCite ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Cite)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeCode ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TCode ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Code)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeCol ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TCol ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Col)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeColgroup ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TColgroup ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Colgroup)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeData ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TData ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Data)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeDatalist ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TDatalist ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Datalist)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeDd ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TDd ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Dd)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeDel ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TDel ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Del)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeDetails ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TDetails ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Details)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeDfn ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TDfn ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Dfn)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeDialog ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TDialog ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Dialog)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeDir ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TDir ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Dir)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeDiv ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TDiv ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Div)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeDl ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TDl ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Dl)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeDt ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TDt ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Dt)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeEm ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TEm ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Em)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeEmbed ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TEmbed ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Embed)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeFieldset ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TFieldset ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Fieldset)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeFigcaption ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TFigcaption ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Figcaption)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeFigure ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TFigure ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Figure)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeFont ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TFont ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Font)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeFooter ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TFooter ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Footer)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeForm ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TForm ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Form)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeFrame ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TFrame ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Frame)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeFrameset ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TFrameset ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Frameset)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeH1 ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TH1 ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.H1)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeH2 ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TH2 ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.H2)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeH3 ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TH3 ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.H3)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeH4 ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TH4 ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.H4)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeH5 ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TH5 ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.H5)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeH6 ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TH6 ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.H6)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeHead ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.THead ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Head)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeHeader ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.THeader ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Header)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeHr ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.THr ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Hr)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeHtml ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.THtml ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Html)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeI ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TI ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.I)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeIframe ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TIframe ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Iframe)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeImg ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TImg ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Img)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeInput ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TInput ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Input)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeIns ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TIns ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Ins)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeKbd ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TKbd ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Kbd)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeLabel ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TLabel ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Label)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeLegend ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TLegend ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Legend)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeLi ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TLi ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Li)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeLink ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TLink ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Link)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeMain ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TMain ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Main)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeMap ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TMap ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Map)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeMark ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TMark ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Mark)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeMeta ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TMeta ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Meta)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeMeter ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TMeter ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Meter)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeNav ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TNav ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Nav)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeNoframes ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TNoframes ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Noframes)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeNoscript ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TNoscript ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Noscript)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeObject ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TObject ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Object)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeOl ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TOl ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Ol)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeOptgroup ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TOptgroup ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Optgroup)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeOption ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TOption ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Option)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeOutput ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TOutput ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Output)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeP ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TP ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.P)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeParam ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TParam ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Param)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changePicture ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TPicture ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Picture)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changePre ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TPre ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Pre)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeProgress ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TProgress ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Progress)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeQ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TQ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Q)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeRp ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TRp ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Rp)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeRt ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TRt ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Rt)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeRuby ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TRuby ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Ruby)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeS ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TS ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.S)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeSamp ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TSamp ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Samp)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeScript ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TScript ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Script)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeSection ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TSection ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Section)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeSelect ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TSelect ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Select)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeSmall ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TSmall ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Small)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeSource ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TSource ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Source)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeSpan ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TSpan ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Span)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeStrike ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TStrike ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Strike)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeStrong ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TStrong ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Strong)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeStyle ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TStyle ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Style)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeSub ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TSub ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Sub)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeSummary ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TSummary ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Summary)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeSup ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TSup ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Sup)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeSvg ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TSvg ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Svg)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeTable ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TTable ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Table)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeTbody ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TTbody ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Tbody)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeTd ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TTd ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Td)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeTemplate ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TTemplate ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Template)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeTextarea ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TTextarea ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Textarea)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeTfoot ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TTfoot ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Tfoot)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeTh ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TTh ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Th)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeThead ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TThead ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Thead)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeTime ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TTime ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Time)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeTitle ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TTitle ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Title)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeTr ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TTr ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Tr)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeTrack ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TTrack ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Track)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeTt ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TTt ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Tt)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeU ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TU ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.U)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeUl ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TUl ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Ul)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeVar ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TVar ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Var)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeVideo ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TVideo ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Video)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeWbr ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TWbr ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Wbr)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
