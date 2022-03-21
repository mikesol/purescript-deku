module Deku.Create where

import Prelude

import Data.Functor (voidRight)
import Data.Hashable (class Hashable)
import Data.Symbol (class IsSymbol, reflectSymbol)
import Deku.Control.Indexed (IxDOM(..))
import Deku.Control.Types (DOM, DOMState', unsafeDOM, unsafeUnDOM)
import Deku.CreateT (class CreateT)
import Deku.Graph.Attribute (Attribute, unsafeUnAttribute)
import Deku.Graph.DOM (unAsSubGraph, unsafeUnRoot, unsafeUnSubgraph, unsafeUnText, unsafeUnTumult)
import Deku.Graph.DOM as CTOR
import Deku.Graph.Graph (Graph)
import Deku.Graph.Node (NodeC)
import Deku.Interpret (class DOMInterpret, makeElement, makeRoot, makeSubgraph, makeText, makeTumult, massiveCreate)
import Deku.Rendered (RootDOMElement(..), ToCreate(..))
import Deku.Tumult (safeUntumult)
import Prim.Row as R
import Type.Proxy (Proxy(..))
import Unsafe.Coerce (unsafeCoerce)

class
  Create (r :: Row Type) (inGraph :: Graph) (outGraph :: Graph)
  | r inGraph -> outGraph where
  create
    :: forall dom engine proof res
     . DOMInterpret dom engine
    => DOM dom engine proof res inGraph { | r }
    -> DOM dom engine proof res outGraph Unit

instance createAll ::
  CreateT r inGraph outGraph =>
  Create r inGraph outGraph where
  create w = o
    where
    { context: i, value } = unsafeUnDOM w
    o =
      unsafeDOM
        { context:
            i
              { instructions = i.instructions <>
                  [ massiveCreate { toCreate: ToCreate $ unsafeCoerce value }
                  ]
              }
        , value: unit
        }
icreate
  :: forall r dom engine proof res inGraph outGraph
   . DOMInterpret dom engine
  => Create r inGraph outGraph
  => { | r }
  -> IxDOM dom engine proof res inGraph outGraph Unit
icreate r = IxDOM (create <<< voidRight r)

-- | Create an dom unit `node` in `igraph` with index `ptr`, resulting in `ograph`.
class
  Create' (ptr :: Symbol) (node :: Type) (inGraph :: Graph) (outGraph :: Graph)
  | ptr node inGraph -> outGraph where
  create'
    :: forall proxy dom engine proof res
     . DOMInterpret dom engine
    => proxy ptr
    -> DOM dom engine proof res inGraph node
    -> DOM dom engine proof res outGraph Unit

icreate'
  :: forall proxy ptr node dom engine proof res i o
   . DOMInterpret dom engine
  => Create' ptr node i o
  => proxy ptr
  -> node
  -> IxDOM dom engine proof res i o Unit
icreate' ptr node = IxDOM (create' ptr <<< voidRight node)

instance createUnit ::
  Create' ptr Unit graphi graphi where
  create' _ w = w

instance createText ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TText {}) graphi grapho
  ) =>
  Create' ptr (CTOR.Text) graphi grapho where
  create' ptr w = o
    where
    { context: i, value } = unsafeUnDOM w
    { text } = unsafeUnText value
    id = reflectSymbol ptr

    o =
      unsafeDOM
        { context:
            i
              { instructions = i.instructions <> [ makeText { id, text } ]
              }
        , value: unit
        }

instance createRoot ::
  ( R.Lacks "root" graphi
  , R.Cons "root" (NodeC CTOR.TRoot {}) graphi grapho
  ) =>
  Create' "root" CTOR.Root graphi grapho where
  create' _ w = o
    where
    { context: i, value } = unsafeUnDOM w
    { element } = unsafeUnRoot value
    o =
      unsafeDOM
        { context:
            i
              { instructions = i.instructions <>
                  [ makeRoot { id: "root", root: RootDOMElement element } ]
              }
        , value: unit
        }

instance createSubgraph ::
  ( IsSymbol ptr
  , IsSymbol terminus
  , R.Lacks ptr graphi
  , Hashable index
  , R.Cons ptr (NodeC (CTOR.TSubgraph terminus env) {}) graphi grapho
  ) =>
  Create' ptr
    (CTOR.Subgraph index terminus env push)
    graphi
    grapho where
  create' ptr w = o
    where
    { context: i, value } = unsafeUnDOM w
    { subgraphMaker, terminus, envs } = unsafeUnSubgraph value
    id = reflectSymbol ptr
    o =
      unsafeDOM
        { context:
            i
              { instructions = i.instructions <>
                  [ makeSubgraph
                      { id
                      , terminus
                      , envs
                      , scenes: unAsSubGraph subgraphMaker
                      }
                  ]
              }
        , value: unit
        }

instance createTumult ::
  ( IsSymbol ptr
  , IsSymbol terminus
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC (CTOR.TTumult terminus) {}) graphi grapho
  ) =>
  Create' ptr (CTOR.Tumult terminus) graphi grapho where
  create' ptr w = o
    where
    { context: i, value } = unsafeUnDOM w
    { tumult } = unsafeUnTumult value
    id = reflectSymbol ptr
    pt = reflectSymbol (Proxy :: _ terminus)
    o =
      unsafeDOM
        { context:
            i
              { instructions = i.instructions <>
                  [ makeTumult
                      { id, terminus: pt, instructions: safeUntumult tumult }
                  ]
              }
        , value: unit
        }

unsafeCreate'
  :: forall ptr elt outGraph proxy dom engine proof res
   . DOMInterpret dom engine
  => IsSymbol ptr
  => proxy ptr
  -> DOMState' dom engine res
  -> Array (Attribute elt)
  -> String
  -> DOM dom engine proof res outGraph Unit
unsafeCreate' ptr i attributes tag = o
  where
  id = reflectSymbol ptr
  o =
    unsafeDOM
      { context:
          i
            { instructions = i.instructions <>
                [ makeElement
                    { id
                    , tag
                    , attributes: map unsafeUnAttribute attributes
                    }
                ]
            }
      , value: unit
      }

-- codegen 2
instance createA_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TA_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.A_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "a"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnA_ value
instance createAbbr_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TAbbr_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Abbr_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "abbr"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnAbbr_ value
instance createAcronym_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TAcronym_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Acronym_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "acronym"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnAcronym_ value
instance createAddress_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TAddress_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Address_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "address"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnAddress_ value
instance createApplet_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TApplet_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Applet_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "applet"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnApplet_ value
instance createArea_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TArea_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Area_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "area"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnArea_ value
instance createArticle_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TArticle_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Article_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "article"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnArticle_ value
instance createAside_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TAside_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Aside_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "aside"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnAside_ value
instance createAudio_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TAudio_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Audio_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "audio"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnAudio_ value
instance createB_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TB_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.B_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "b"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnB_ value
instance createBase_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TBase_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Base_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "base"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnBase_ value
instance createBasefont_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TBasefont_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Basefont_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "basefont"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnBasefont_ value
instance createBdi_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TBdi_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Bdi_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "bdi"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnBdi_ value
instance createBdo_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TBdo_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Bdo_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "bdo"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnBdo_ value
instance createBig_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TBig_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Big_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "big"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnBig_ value
instance createBlockquote_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TBlockquote_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Blockquote_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "blockquote"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnBlockquote_ value
instance createBody_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TBody_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Body_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "body"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnBody_ value
instance createBr_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TBr_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Br_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "br"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnBr_ value
instance createButton_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TButton_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Button_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "button"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnButton_ value
instance createCanvas_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TCanvas_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Canvas_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "canvas"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnCanvas_ value
instance createCaption_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TCaption_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Caption_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "caption"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnCaption_ value
instance createCenter_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TCenter_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Center_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "center"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnCenter_ value
instance createCite_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TCite_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Cite_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "cite"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnCite_ value
instance createCode_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TCode_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Code_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "code"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnCode_ value
instance createCol_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TCol_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Col_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "col"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnCol_ value
instance createColgroup_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TColgroup_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Colgroup_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "colgroup"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnColgroup_ value
instance createXdata_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TXdata_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Xdata_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "data"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnXdata_ value
instance createDatalist_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TDatalist_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Datalist_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "datalist"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnDatalist_ value
instance createDd_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TDd_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Dd_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "dd"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnDd_ value
instance createDel_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TDel_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Del_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "del"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnDel_ value
instance createDetails_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TDetails_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Details_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "details"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnDetails_ value
instance createDfn_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TDfn_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Dfn_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "dfn"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnDfn_ value
instance createDialog_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TDialog_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Dialog_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "dialog"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnDialog_ value
instance createDir_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TDir_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Dir_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "dir"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnDir_ value
instance createDiv_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TDiv_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Div_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "div"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnDiv_ value
instance createDl_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TDl_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Dl_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "dl"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnDl_ value
instance createDt_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TDt_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Dt_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "dt"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnDt_ value
instance createEm_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TEm_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Em_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "em"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnEm_ value
instance createEmbed_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TEmbed_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Embed_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "embed"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnEmbed_ value
instance createFieldset_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TFieldset_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Fieldset_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "fieldset"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnFieldset_ value
instance createFigcaption_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TFigcaption_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Figcaption_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "figcaption"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnFigcaption_ value
instance createFigure_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TFigure_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Figure_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "figure"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnFigure_ value
instance createFont_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TFont_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Font_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "font"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnFont_ value
instance createFooter_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TFooter_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Footer_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "footer"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnFooter_ value
instance createForm_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TForm_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Form_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "form"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnForm_ value
instance createFrame_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TFrame_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Frame_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "frame"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnFrame_ value
instance createFrameset_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TFrameset_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Frameset_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "frameset"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnFrameset_ value
instance createH1_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TH1_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.H1_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "h1"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnH1_ value
instance createH2_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TH2_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.H2_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "h2"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnH2_ value
instance createH3_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TH3_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.H3_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "h3"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnH3_ value
instance createH4_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TH4_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.H4_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "h4"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnH4_ value
instance createH5_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TH5_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.H5_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "h5"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnH5_ value
instance createH6_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TH6_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.H6_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "h6"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnH6_ value
instance createHead_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.THead_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Head_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "head"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnHead_ value
instance createHeader_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.THeader_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Header_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "header"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnHeader_ value
instance createHr_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.THr_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Hr_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "hr"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnHr_ value
instance createHtml_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.THtml_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Html_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "html"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnHtml_ value
instance createI_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TI_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.I_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "i"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnI_ value
instance createIframe_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TIframe_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Iframe_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "iframe"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnIframe_ value
instance createImg_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TImg_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Img_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "img"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnImg_ value
instance createInput_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TInput_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Input_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "input"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnInput_ value
instance createIns_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TIns_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Ins_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "ins"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnIns_ value
instance createKbd_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TKbd_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Kbd_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "kbd"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnKbd_ value
instance createLabel_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TLabel_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Label_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "label"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnLabel_ value
instance createLegend_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TLegend_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Legend_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "legend"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnLegend_ value
instance createLi_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TLi_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Li_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "li"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnLi_ value
instance createLink_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TLink_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Link_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "link"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnLink_ value
instance createMain_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TMain_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Main_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "main"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnMain_ value
instance createMap_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TMap_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Map_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "map"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnMap_ value
instance createMark_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TMark_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Mark_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "mark"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnMark_ value
instance createMeta_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TMeta_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Meta_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "meta"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnMeta_ value
instance createMeter_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TMeter_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Meter_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "meter"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnMeter_ value
instance createNav_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TNav_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Nav_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "nav"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnNav_ value
instance createNoframes_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TNoframes_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Noframes_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "noframes"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnNoframes_ value
instance createNoscript_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TNoscript_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Noscript_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "noscript"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnNoscript_ value
instance createObject_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TObject_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Object_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "object"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnObject_ value
instance createOl_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TOl_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Ol_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "ol"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnOl_ value
instance createOptgroup_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TOptgroup_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Optgroup_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "optgroup"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnOptgroup_ value
instance createOption_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TOption_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Option_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "option"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnOption_ value
instance createOutput_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TOutput_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Output_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "output"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnOutput_ value
instance createP_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TP_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.P_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "p"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnP_ value
instance createParam_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TParam_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Param_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "param"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnParam_ value
instance createPicture_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TPicture_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Picture_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "picture"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnPicture_ value
instance createPre_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TPre_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Pre_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "pre"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnPre_ value
instance createProgress_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TProgress_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Progress_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "progress"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnProgress_ value
instance createQ_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TQ_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Q_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "q"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnQ_ value
instance createRp_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TRp_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Rp_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "rp"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnRp_ value
instance createRt_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TRt_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Rt_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "rt"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnRt_ value
instance createRuby_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TRuby_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Ruby_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "ruby"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnRuby_ value
instance createS_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TS_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.S_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "s"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnS_ value
instance createSamp_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TSamp_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Samp_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "samp"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnSamp_ value
instance createScript_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TScript_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Script_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "script"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnScript_ value
instance createSection_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TSection_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Section_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "section"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnSection_ value
instance createSelect_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TSelect_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Select_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "select"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnSelect_ value
instance createSmall_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TSmall_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Small_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "small"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnSmall_ value
instance createSource_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TSource_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Source_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "source"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnSource_ value
instance createSpan_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TSpan_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Span_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "span"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnSpan_ value
instance createStrike_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TStrike_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Strike_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "strike"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnStrike_ value
instance createStrong_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TStrong_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Strong_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "strong"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnStrong_ value
instance createStyle_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TStyle_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Style_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "style"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnStyle_ value
instance createSub_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TSub_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Sub_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "sub"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnSub_ value
instance createSummary_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TSummary_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Summary_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "summary"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnSummary_ value
instance createSup_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TSup_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Sup_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "sup"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnSup_ value
instance createSvg_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TSvg_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Svg_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "svg"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnSvg_ value
instance createTable_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTable_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Table_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "table"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnTable_ value
instance createTbody_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTbody_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Tbody_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "tbody"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnTbody_ value
instance createTd_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTd_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Td_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "td"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnTd_ value
instance createTemplate_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTemplate_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Template_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "template"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnTemplate_ value
instance createTextarea_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTextarea_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Textarea_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "textarea"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnTextarea_ value
instance createTfoot_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTfoot_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Tfoot_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "tfoot"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnTfoot_ value
instance createTh_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTh_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Th_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "th"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnTh_ value
instance createThead_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TThead_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Thead_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "thead"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnThead_ value
instance createTime_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTime_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Time_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "time"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnTime_ value
instance createTitle_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTitle_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Title_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "title"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnTitle_ value
instance createTr_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTr_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Tr_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "tr"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnTr_ value
instance createTrack_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTrack_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Track_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "track"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnTrack_ value
instance createTt_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTt_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Tt_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "tt"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnTt_ value
instance createU_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TU_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.U_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "u"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnU_ value
instance createUl_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TUl_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Ul_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "ul"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnUl_ value
instance createVar_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TVar_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Var_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "var"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnVar_ value
instance createVideo_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TVideo_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Video_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "video"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnVideo_ value
instance createWbr_ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TWbr_ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Wbr_ graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "wbr"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnWbr_ value
-- codegen 2
