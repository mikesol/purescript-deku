module Deku.Change where

import Prelude

import Data.Symbol (class IsSymbol, reflectSymbol)
import Deku.Control.Monadic (MDOM(..))
import Deku.Control.Types (DOM, DOMState', unsafeDOM, unsafeUnDOM)
import Deku.Graph.Attribute (Attribute, AttributeValue, unsafeUnAttribute)
import Deku.Graph.DOM (unsafeUnSubgraph)
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
    ( (change'impl (Proxy :: _ key) (w $> (get (Proxy :: _ key) value))) $>
        value
    )
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
  Change' ptr (Array (Attribute CTOR.A_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeAbbr_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TAbbr_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Abbr_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeAcronym_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TAcronym_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Acronym_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeAddress_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TAddress_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Address_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeApplet_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TApplet_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Applet_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeArea_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TArea_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Area_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeArticle_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TArticle_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Article_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeAside_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TAside_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Aside_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeAudio_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TAudio_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Audio_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeB_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TB_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.B_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeBase_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TBase_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Base_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeBasefont_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TBasefont_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Basefont_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeBdi_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TBdi_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Bdi_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeBdo_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TBdo_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Bdo_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeBig_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TBig_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Big_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeBlockquote_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TBlockquote_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Blockquote_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeBody_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TBody_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Body_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeBr_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TBr_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Br_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeButton_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TButton_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Button_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeCanvas_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TCanvas_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Canvas_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeCaption_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TCaption_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Caption_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeCenter_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TCenter_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Center_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeCite_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TCite_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Cite_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeCode_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TCode_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Code_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeCol_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TCol_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Col_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeColgroup_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TColgroup_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Colgroup_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeXdata_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TXdata_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Xdata_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeDatalist_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TDatalist_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Datalist_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeDd_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TDd_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Dd_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeDel_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TDel_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Del_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeDetails_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TDetails_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Details_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeDfn_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TDfn_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Dfn_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeDialog_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TDialog_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Dialog_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeDir_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TDir_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Dir_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeDiv_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TDiv_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Div_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeDl_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TDl_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Dl_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeDt_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TDt_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Dt_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeEm_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TEm_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Em_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeEmbed_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TEmbed_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Embed_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeFieldset_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TFieldset_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Fieldset_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeFigcaption_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TFigcaption_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Figcaption_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeFigure_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TFigure_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Figure_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeFont_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TFont_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Font_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeFooter_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TFooter_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Footer_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeForm_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TForm_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Form_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeFrame_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TFrame_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Frame_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeFrameset_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TFrameset_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Frameset_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeH1_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TH1_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.H1_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeH2_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TH2_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.H2_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeH3_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TH3_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.H3_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeH4_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TH4_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.H4_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeH5_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TH5_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.H5_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeH6_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TH6_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.H6_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeHead_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.THead_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Head_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeHeader_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.THeader_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Header_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeHr_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.THr_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Hr_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeHtml_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.THtml_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Html_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeI_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TI_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.I_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeIframe_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TIframe_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Iframe_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeImg_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TImg_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Img_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeInput_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TInput_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Input_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeIns_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TIns_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Ins_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeKbd_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TKbd_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Kbd_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeLabel_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TLabel_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Label_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeLegend_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TLegend_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Legend_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeLi_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TLi_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Li_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeLink_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TLink_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Link_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeMain_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TMain_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Main_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeMap_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TMap_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Map_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeMark_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TMark_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Mark_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeMeta_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TMeta_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Meta_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeMeter_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TMeter_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Meter_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeNav_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TNav_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Nav_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeNoframes_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TNoframes_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Noframes_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeNoscript_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TNoscript_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Noscript_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeObject_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TObject_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Object_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeOl_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TOl_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Ol_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeOptgroup_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TOptgroup_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Optgroup_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeOption_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TOption_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Option_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeOutput_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TOutput_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Output_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeP_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TP_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.P_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeParam_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TParam_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Param_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changePicture_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TPicture_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Picture_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changePre_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TPre_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Pre_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeProgress_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TProgress_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Progress_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeQ_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TQ_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Q_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeRp_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TRp_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Rp_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeRt_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TRt_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Rt_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeRuby_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TRuby_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Ruby_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeS_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TS_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.S_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeSamp_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TSamp_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Samp_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeScript_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TScript_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Script_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeSection_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TSection_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Section_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeSelect_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TSelect_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Select_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeSmall_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TSmall_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Small_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeSource_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TSource_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Source_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeSpan_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TSpan_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Span_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeStrike_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TStrike_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Strike_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeStrong_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TStrong_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Strong_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeStyle_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TStyle_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Style_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeSub_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TSub_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Sub_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeSummary_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TSummary_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Summary_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeSup_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TSup_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Sup_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeSvg_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TSvg_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Svg_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeTable_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TTable_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Table_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeTbody_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TTbody_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Tbody_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeTd_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TTd_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Td_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeTemplate_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TTemplate_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Template_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeTextarea_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TTextarea_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Textarea_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeTfoot_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TTfoot_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Tfoot_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeTh_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TTh_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Th_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeThead_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TThead_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Thead_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeTime_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TTime_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Time_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeTitle_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TTitle_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Title_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeTr_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TTr_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Tr_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeTrack_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TTrack_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Track_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeTt_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TTt_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Tt_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeU_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TU_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.U_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeUl_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TUl_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Ul_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeVar_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TVar_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Var_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeVideo_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TVideo_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Video_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
instance changeWbr_ ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TWbr_ ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.Wbr_)) graph where
  change'impl ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w
-- codegen 4