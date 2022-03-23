module Deku.Change where

import Prelude

import Data.Symbol (class IsSymbol, reflectSymbol)
import Deku.Control.Monadic (MDOM(..))
import Deku.Control.Types (DOM, DOMState', unsafeDOM, unsafeUnDOM)
import Deku.Graph.Attribute (Attribute, AttributeValue, unsafeUnAttribute)
import Deku.Graph.DOM (unsafeUnSubgraph, unsafeUnText)
import Deku.Graph.DOM as CTOR
import Deku.Graph.Graph (Graph)
import Deku.Graph.Node (NodeC)
import Deku.Interpret (class DOMInterpret, setAttribute, setSubgraph, setText)
import Prim.Row (class Cons, class Lacks)
import Prim.Row as R
import Prim.RowList as RL
import Record (get)
import Type.Proxy (Proxy(..))

type Change'Type (ptr :: Symbol) (a :: Type) (graph :: Graph) =
  forall proxy dom engine proof res
   . DOMInterpret dom engine
  => proxy ptr
  -> DOM dom engine proof res graph a
  -> DOM dom engine proof res graph Unit

-- | Change an dom unit `node` in `igraph` with index `ptr`, outputting the changed node.
class Change' (ptr :: Symbol) (a :: Type) (graph :: Graph) where
  change'impl :: Change'Type ptr a graph

change'
  :: forall proxy ptr a dom engine proof res i
   . DOMInterpret dom engine
  => Change' ptr a i
  => proxy ptr
  -> a
  -> MDOM dom engine proof res i Unit
change' ptr a = MDOM (change'impl ptr <<< (<$) a)

--
class Change (r :: Row Type) (graph :: Graph) where
  change'rec
    :: forall dom engine proof res
     . DOMInterpret dom engine
    => DOM dom engine proof res graph { | r }
    -> DOM dom engine proof res graph Unit

class ChangeRL (rl :: RL.RowList Type) (r :: Row Type) (graph :: Graph) where
  changeRL_
    :: forall proxy dom engine proof res
     . DOMInterpret dom engine
    => proxy rl
    -> DOM dom engine proof res graph { | r }
    -> DOM dom engine proof res graph Unit

instance changeRL_Cons ::
  ( IsSymbol key
  , Cons key val r' r
  , Lacks key r'
  , Change' key val graph
  , ChangeRL rest r graph
  ) =>
  ChangeRL (RL.Cons key val rest) r graph where
  changeRL_ _ w = changeRL_ (Proxy :: _ rest)
    ((change'impl (Proxy :: _ key) (w $> (get (Proxy :: _ key) value))) $> value)
    where
    { value } = unsafeUnDOM w

instance changeRL_Nil :: ChangeRL RL.Nil r graph where
  changeRL_ _ w = w $> unit

instance changeAll ::
  ( RL.RowToList r rl
  , ChangeRL rl r graph
  ) =>
  Change r graph where
  change'rec = changeRL_ (Proxy :: _ rl)

change
  :: forall r dom engine proof res inGraph
   . DOMInterpret dom engine
  => Change r inGraph
  => { | r }
  -> MDOM dom engine proof res inGraph Unit
change r = MDOM (change'rec <<< (<$) r)

instance changeText ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TText edges) ignore graph
  ) =>
  Change' ptr (CTOR.Text) graph where
  change'impl ptr w = o
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
  change'impl ptr w = o
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
  change'impl _ w = w $> unit

instance changeSubgraph0 ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC (CTOR.TSubgraph env) edges) ignore graph
  ) =>
  Change' ptr (CTOR.Subgraph index env push) graph where
  change'impl ptr w = o
    where
    { context: i, value } = unsafeUnDOM w
    { envs } = unsafeUnSubgraph value
    id = reflectSymbol ptr

    o =
      unsafeDOM
        { context:
            i
              { instructions = i.instructions <>
                  [ setSubgraph
                      { id
                      , envs
                      }
                  ]
              }
        , value: unit
        }

instance changeSubgraph1 ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC (CTOR.TSubgraph env) edges) ignore graph
  ) =>
  Change' ptr (CTOR.XSubgraph index env) graph where
  change'impl ptr w = o
    where
    { context: i, value } = unsafeUnDOM w

    id = reflectSymbol ptr
    { envs } = CTOR.unsafeUnXSubgraph value

    o =
      unsafeDOM
        { context:
            i
              { instructions = i.instructions <>
                  [ setSubgraph
                      { id
                      , envs
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

-- codegen 4
instance changeA_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TA_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.A_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeAbbr_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TAbbr_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Abbr_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeAcronym_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TAcronym_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Acronym_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeAddress_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TAddress_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Address_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeApplet_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TApplet_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Applet_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeArea_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TArea_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Area_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeArticle_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TArticle_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Article_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeAside_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TAside_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Aside_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeAudio_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TAudio_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Audio_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeB_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TB_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.B_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeBase_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TBase_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Base_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeBasefont_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TBasefont_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Basefont_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeBdi_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TBdi_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Bdi_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeBdo_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TBdo_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Bdo_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeBig_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TBig_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Big_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeBlockquote_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TBlockquote_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Blockquote_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeBody_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TBody_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Body_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeBr_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TBr_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Br_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeButton_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TButton_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Button_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeCanvas_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TCanvas_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Canvas_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeCaption_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TCaption_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Caption_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeCenter_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TCenter_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Center_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeCite_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TCite_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Cite_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeCode_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TCode_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Code_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeCol_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TCol_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Col_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeColgroup_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TColgroup_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Colgroup_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeXdata_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TXdata_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Xdata_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeDatalist_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TDatalist_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Datalist_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeDd_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TDd_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Dd_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeDel_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TDel_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Del_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeDetails_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TDetails_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Details_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeDfn_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TDfn_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Dfn_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeDialog_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TDialog_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Dialog_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeDir_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TDir_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Dir_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeDiv_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TDiv_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Div_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeDl_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TDl_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Dl_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeDt_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TDt_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Dt_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeEm_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TEm_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Em_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeEmbed_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TEmbed_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Embed_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeFieldset_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TFieldset_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Fieldset_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeFigcaption_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TFigcaption_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Figcaption_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeFigure_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TFigure_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Figure_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeFont_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TFont_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Font_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeFooter_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TFooter_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Footer_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeForm_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TForm_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Form_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeFrame_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TFrame_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Frame_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeFrameset_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TFrameset_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Frameset_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeH1_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TH1_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.H1_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeH2_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TH2_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.H2_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeH3_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TH3_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.H3_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeH4_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TH4_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.H4_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeH5_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TH5_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.H5_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeH6_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TH6_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.H6_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeHead_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.THead_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Head_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeHeader_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.THeader_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Header_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeHr_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.THr_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Hr_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeHtml_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.THtml_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Html_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeI_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TI_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.I_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeIframe_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TIframe_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Iframe_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeImg_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TImg_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Img_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeInput_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TInput_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Input_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeIns_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TIns_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Ins_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeKbd_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TKbd_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Kbd_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeLabel_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TLabel_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Label_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeLegend_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TLegend_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Legend_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeLi_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TLi_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Li_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeLink_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TLink_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Link_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeMain_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TMain_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Main_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeMap_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TMap_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Map_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeMark_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TMark_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Mark_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeMeta_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TMeta_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Meta_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeMeter_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TMeter_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Meter_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeNav_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TNav_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Nav_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeNoframes_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TNoframes_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Noframes_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeNoscript_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TNoscript_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Noscript_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeObject_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TObject_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Object_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeOl_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TOl_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Ol_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeOptgroup_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TOptgroup_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Optgroup_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeOption_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TOption_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Option_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeOutput_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TOutput_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Output_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeP_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TP_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.P_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeParam_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TParam_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Param_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changePicture_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TPicture_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Picture_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changePre_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TPre_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Pre_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeProgress_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TProgress_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Progress_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeQ_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TQ_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Q_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeRp_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TRp_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Rp_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeRt_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TRt_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Rt_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeRuby_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TRuby_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Ruby_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeS_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TS_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.S_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeSamp_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TSamp_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Samp_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeScript_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TScript_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Script_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeSection_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TSection_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Section_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeSelect_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TSelect_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Select_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeSmall_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TSmall_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Small_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeSource_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TSource_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Source_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeSpan_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TSpan_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Span_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeStrike_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TStrike_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Strike_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeStrong_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TStrong_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Strong_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeStyle_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TStyle_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Style_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeSub_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TSub_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Sub_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeSummary_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TSummary_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Summary_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeSup_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TSup_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Sup_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeSvg_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TSvg_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Svg_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeTable_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TTable_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Table_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeTbody_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TTbody_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Tbody_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeTd_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TTd_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Td_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeTemplate_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TTemplate_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Template_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeTextarea_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TTextarea_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Textarea_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeTfoot_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TTfoot_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Tfoot_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeTh_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TTh_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Th_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeThead_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TThead_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Thead_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeTime_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TTime_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Time_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeTitle_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TTitle_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Title_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeTr_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TTr_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Tr_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeTrack_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TTrack_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Track_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeTt_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TTt_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Tt_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeU_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TU_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.U_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeUl_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TUl_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Ul_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeVar_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TVar_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Var_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeVideo_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TVideo_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Video_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeWbr_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TWbr_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Wbr_)) grapho where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
-- codegen 4