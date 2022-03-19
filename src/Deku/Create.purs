module Deku.Create where

import Prelude

import Data.Functor (voidRight)
import Data.Symbol (class IsSymbol, reflectSymbol)
import Data.Typelevel.Num (class Pos)
import Data.Vec as V
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
  , Pos n
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC (CTOR.TSubgraph n terminus env) {}) graphi grapho
  ) =>
  Create' ptr
    (CTOR.Subgraph (CTOR.AsSubgraph terminus env push) (V.Vec n env))
    graphi
    grapho where
  create' ptr w = o
    where
    { context: i, value } = unsafeUnDOM w
    { subgraphMaker, envs, terminus } = unsafeUnSubgraph value
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
  , Pos n
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC (CTOR.TTumult n terminus) {}) graphi grapho
  ) =>
  Create' ptr (CTOR.Tumult n terminus) graphi grapho where
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

-- codegen
instance createA ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TA {}) graphi grapho
  ) =>
  Create' ptr CTOR.A graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "a"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnA value
instance createAbbr ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TAbbr {}) graphi grapho
  ) =>
  Create' ptr CTOR.Abbr graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "abbr"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnAbbr value
instance createAcronym ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TAcronym {}) graphi grapho
  ) =>
  Create' ptr CTOR.Acronym graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "acronym"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnAcronym value
instance createAddress ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TAddress {}) graphi grapho
  ) =>
  Create' ptr CTOR.Address graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "address"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnAddress value
instance createApplet ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TApplet {}) graphi grapho
  ) =>
  Create' ptr CTOR.Applet graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "applet"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnApplet value
instance createArea ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TArea {}) graphi grapho
  ) =>
  Create' ptr CTOR.Area graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "area"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnArea value
instance createArticle ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TArticle {}) graphi grapho
  ) =>
  Create' ptr CTOR.Article graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "article"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnArticle value
instance createAside ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TAside {}) graphi grapho
  ) =>
  Create' ptr CTOR.Aside graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "aside"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnAside value
instance createAudio ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TAudio {}) graphi grapho
  ) =>
  Create' ptr CTOR.Audio graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "audio"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnAudio value
instance createB ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TB {}) graphi grapho
  ) =>
  Create' ptr CTOR.B graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "b"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnB value
instance createBase ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TBase {}) graphi grapho
  ) =>
  Create' ptr CTOR.Base graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "base"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnBase value
instance createBasefont ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TBasefont {}) graphi grapho
  ) =>
  Create' ptr CTOR.Basefont graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "basefont"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnBasefont value
instance createBdi ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TBdi {}) graphi grapho
  ) =>
  Create' ptr CTOR.Bdi graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "bdi"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnBdi value
instance createBdo ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TBdo {}) graphi grapho
  ) =>
  Create' ptr CTOR.Bdo graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "bdo"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnBdo value
instance createBig ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TBig {}) graphi grapho
  ) =>
  Create' ptr CTOR.Big graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "big"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnBig value
instance createBlockquote ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TBlockquote {}) graphi grapho
  ) =>
  Create' ptr CTOR.Blockquote graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "blockquote"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnBlockquote value
instance createBody ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TBody {}) graphi grapho
  ) =>
  Create' ptr CTOR.Body graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "body"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnBody value
instance createBr ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TBr {}) graphi grapho
  ) =>
  Create' ptr CTOR.Br graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "br"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnBr value
instance createButton ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TButton {}) graphi grapho
  ) =>
  Create' ptr CTOR.Button graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "button"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnButton value
instance createCanvas ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TCanvas {}) graphi grapho
  ) =>
  Create' ptr CTOR.Canvas graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "canvas"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnCanvas value
instance createCaption ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TCaption {}) graphi grapho
  ) =>
  Create' ptr CTOR.Caption graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "caption"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnCaption value
instance createCenter ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TCenter {}) graphi grapho
  ) =>
  Create' ptr CTOR.Center graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "center"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnCenter value
instance createCite ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TCite {}) graphi grapho
  ) =>
  Create' ptr CTOR.Cite graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "cite"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnCite value
instance createCode ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TCode {}) graphi grapho
  ) =>
  Create' ptr CTOR.Code graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "code"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnCode value
instance createCol ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TCol {}) graphi grapho
  ) =>
  Create' ptr CTOR.Col graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "col"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnCol value
instance createColgroup ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TColgroup {}) graphi grapho
  ) =>
  Create' ptr CTOR.Colgroup graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "colgroup"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnColgroup value
instance createData ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TData {}) graphi grapho
  ) =>
  Create' ptr CTOR.Data graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "data"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnData value
instance createDatalist ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TDatalist {}) graphi grapho
  ) =>
  Create' ptr CTOR.Datalist graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "datalist"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnDatalist value
instance createDd ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TDd {}) graphi grapho
  ) =>
  Create' ptr CTOR.Dd graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "dd"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnDd value
instance createDel ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TDel {}) graphi grapho
  ) =>
  Create' ptr CTOR.Del graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "del"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnDel value
instance createDetails ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TDetails {}) graphi grapho
  ) =>
  Create' ptr CTOR.Details graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "details"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnDetails value
instance createDfn ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TDfn {}) graphi grapho
  ) =>
  Create' ptr CTOR.Dfn graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "dfn"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnDfn value
instance createDialog ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TDialog {}) graphi grapho
  ) =>
  Create' ptr CTOR.Dialog graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "dialog"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnDialog value
instance createDir ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TDir {}) graphi grapho
  ) =>
  Create' ptr CTOR.Dir graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "dir"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnDir value
instance createDiv ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TDiv {}) graphi grapho
  ) =>
  Create' ptr CTOR.Div graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "div"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnDiv value
instance createDl ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TDl {}) graphi grapho
  ) =>
  Create' ptr CTOR.Dl graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "dl"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnDl value
instance createDt ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TDt {}) graphi grapho
  ) =>
  Create' ptr CTOR.Dt graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "dt"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnDt value
instance createEm ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TEm {}) graphi grapho
  ) =>
  Create' ptr CTOR.Em graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "em"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnEm value
instance createEmbed ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TEmbed {}) graphi grapho
  ) =>
  Create' ptr CTOR.Embed graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "embed"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnEmbed value
instance createFieldset ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TFieldset {}) graphi grapho
  ) =>
  Create' ptr CTOR.Fieldset graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "fieldset"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnFieldset value
instance createFigcaption ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TFigcaption {}) graphi grapho
  ) =>
  Create' ptr CTOR.Figcaption graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "figcaption"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnFigcaption value
instance createFigure ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TFigure {}) graphi grapho
  ) =>
  Create' ptr CTOR.Figure graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "figure"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnFigure value
instance createFont ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TFont {}) graphi grapho
  ) =>
  Create' ptr CTOR.Font graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "font"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnFont value
instance createFooter ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TFooter {}) graphi grapho
  ) =>
  Create' ptr CTOR.Footer graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "footer"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnFooter value
instance createForm ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TForm {}) graphi grapho
  ) =>
  Create' ptr CTOR.Form graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "form"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnForm value
instance createFrame ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TFrame {}) graphi grapho
  ) =>
  Create' ptr CTOR.Frame graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "frame"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnFrame value
instance createFrameset ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TFrameset {}) graphi grapho
  ) =>
  Create' ptr CTOR.Frameset graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "frameset"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnFrameset value
instance createH1 ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TH1 {}) graphi grapho
  ) =>
  Create' ptr CTOR.H1 graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "h1"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnH1 value
instance createH2 ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TH2 {}) graphi grapho
  ) =>
  Create' ptr CTOR.H2 graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "h2"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnH2 value
instance createH3 ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TH3 {}) graphi grapho
  ) =>
  Create' ptr CTOR.H3 graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "h3"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnH3 value
instance createH4 ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TH4 {}) graphi grapho
  ) =>
  Create' ptr CTOR.H4 graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "h4"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnH4 value
instance createH5 ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TH5 {}) graphi grapho
  ) =>
  Create' ptr CTOR.H5 graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "h5"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnH5 value
instance createH6 ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TH6 {}) graphi grapho
  ) =>
  Create' ptr CTOR.H6 graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "h6"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnH6 value
instance createHead ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.THead {}) graphi grapho
  ) =>
  Create' ptr CTOR.Head graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "head"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnHead value
instance createHeader ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.THeader {}) graphi grapho
  ) =>
  Create' ptr CTOR.Header graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "header"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnHeader value
instance createHr ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.THr {}) graphi grapho
  ) =>
  Create' ptr CTOR.Hr graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "hr"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnHr value
instance createHtml ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.THtml {}) graphi grapho
  ) =>
  Create' ptr CTOR.Html graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "html"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnHtml value
instance createI ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TI {}) graphi grapho
  ) =>
  Create' ptr CTOR.I graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "i"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnI value
instance createIframe ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TIframe {}) graphi grapho
  ) =>
  Create' ptr CTOR.Iframe graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "iframe"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnIframe value
instance createImg ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TImg {}) graphi grapho
  ) =>
  Create' ptr CTOR.Img graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "img"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnImg value
instance createInput ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TInput {}) graphi grapho
  ) =>
  Create' ptr CTOR.Input graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "input"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnInput value
instance createIns ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TIns {}) graphi grapho
  ) =>
  Create' ptr CTOR.Ins graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "ins"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnIns value
instance createKbd ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TKbd {}) graphi grapho
  ) =>
  Create' ptr CTOR.Kbd graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "kbd"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnKbd value
instance createLabel ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TLabel {}) graphi grapho
  ) =>
  Create' ptr CTOR.Label graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "label"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnLabel value
instance createLegend ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TLegend {}) graphi grapho
  ) =>
  Create' ptr CTOR.Legend graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "legend"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnLegend value
instance createLi ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TLi {}) graphi grapho
  ) =>
  Create' ptr CTOR.Li graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "li"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnLi value
instance createLink ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TLink {}) graphi grapho
  ) =>
  Create' ptr CTOR.Link graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "link"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnLink value
instance createMain ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TMain {}) graphi grapho
  ) =>
  Create' ptr CTOR.Main graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "main"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnMain value
instance createMap ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TMap {}) graphi grapho
  ) =>
  Create' ptr CTOR.Map graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "map"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnMap value
instance createMark ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TMark {}) graphi grapho
  ) =>
  Create' ptr CTOR.Mark graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "mark"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnMark value
instance createMeta ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TMeta {}) graphi grapho
  ) =>
  Create' ptr CTOR.Meta graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "meta"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnMeta value
instance createMeter ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TMeter {}) graphi grapho
  ) =>
  Create' ptr CTOR.Meter graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "meter"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnMeter value
instance createNav ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TNav {}) graphi grapho
  ) =>
  Create' ptr CTOR.Nav graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "nav"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnNav value
instance createNoframes ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TNoframes {}) graphi grapho
  ) =>
  Create' ptr CTOR.Noframes graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "noframes"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnNoframes value
instance createNoscript ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TNoscript {}) graphi grapho
  ) =>
  Create' ptr CTOR.Noscript graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "noscript"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnNoscript value
instance createObject ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TObject {}) graphi grapho
  ) =>
  Create' ptr CTOR.Object graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "object"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnObject value
instance createOl ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TOl {}) graphi grapho
  ) =>
  Create' ptr CTOR.Ol graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "ol"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnOl value
instance createOptgroup ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TOptgroup {}) graphi grapho
  ) =>
  Create' ptr CTOR.Optgroup graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "optgroup"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnOptgroup value
instance createOption ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TOption {}) graphi grapho
  ) =>
  Create' ptr CTOR.Option graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "option"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnOption value
instance createOutput ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TOutput {}) graphi grapho
  ) =>
  Create' ptr CTOR.Output graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "output"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnOutput value
instance createP ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TP {}) graphi grapho
  ) =>
  Create' ptr CTOR.P graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "p"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnP value
instance createParam ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TParam {}) graphi grapho
  ) =>
  Create' ptr CTOR.Param graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "param"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnParam value
instance createPicture ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TPicture {}) graphi grapho
  ) =>
  Create' ptr CTOR.Picture graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "picture"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnPicture value
instance createPre ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TPre {}) graphi grapho
  ) =>
  Create' ptr CTOR.Pre graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "pre"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnPre value
instance createProgress ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TProgress {}) graphi grapho
  ) =>
  Create' ptr CTOR.Progress graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "progress"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnProgress value
instance createQ ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TQ {}) graphi grapho
  ) =>
  Create' ptr CTOR.Q graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "q"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnQ value
instance createRp ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TRp {}) graphi grapho
  ) =>
  Create' ptr CTOR.Rp graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "rp"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnRp value
instance createRt ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TRt {}) graphi grapho
  ) =>
  Create' ptr CTOR.Rt graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "rt"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnRt value
instance createRuby ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TRuby {}) graphi grapho
  ) =>
  Create' ptr CTOR.Ruby graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "ruby"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnRuby value
instance createS ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TS {}) graphi grapho
  ) =>
  Create' ptr CTOR.S graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "s"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnS value
instance createSamp ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TSamp {}) graphi grapho
  ) =>
  Create' ptr CTOR.Samp graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "samp"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnSamp value
instance createScript ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TScript {}) graphi grapho
  ) =>
  Create' ptr CTOR.Script graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "script"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnScript value
instance createSection ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TSection {}) graphi grapho
  ) =>
  Create' ptr CTOR.Section graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "section"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnSection value
instance createSelect ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TSelect {}) graphi grapho
  ) =>
  Create' ptr CTOR.Select graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "select"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnSelect value
instance createSmall ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TSmall {}) graphi grapho
  ) =>
  Create' ptr CTOR.Small graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "small"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnSmall value
instance createSource ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TSource {}) graphi grapho
  ) =>
  Create' ptr CTOR.Source graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "source"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnSource value
instance createSpan ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TSpan {}) graphi grapho
  ) =>
  Create' ptr CTOR.Span graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "span"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnSpan value
instance createStrike ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TStrike {}) graphi grapho
  ) =>
  Create' ptr CTOR.Strike graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "strike"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnStrike value
instance createStrong ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TStrong {}) graphi grapho
  ) =>
  Create' ptr CTOR.Strong graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "strong"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnStrong value
instance createStyle ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TStyle {}) graphi grapho
  ) =>
  Create' ptr CTOR.Style graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "style"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnStyle value
instance createSub ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TSub {}) graphi grapho
  ) =>
  Create' ptr CTOR.Sub graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "sub"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnSub value
instance createSummary ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TSummary {}) graphi grapho
  ) =>
  Create' ptr CTOR.Summary graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "summary"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnSummary value
instance createSup ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TSup {}) graphi grapho
  ) =>
  Create' ptr CTOR.Sup graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "sup"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnSup value
instance createSvg ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TSvg {}) graphi grapho
  ) =>
  Create' ptr CTOR.Svg graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "svg"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnSvg value
instance createTable ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTable {}) graphi grapho
  ) =>
  Create' ptr CTOR.Table graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "table"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnTable value
instance createTbody ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTbody {}) graphi grapho
  ) =>
  Create' ptr CTOR.Tbody graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "tbody"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnTbody value
instance createTd ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTd {}) graphi grapho
  ) =>
  Create' ptr CTOR.Td graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "td"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnTd value
instance createTemplate ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTemplate {}) graphi grapho
  ) =>
  Create' ptr CTOR.Template graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "template"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnTemplate value
instance createTextarea ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTextarea {}) graphi grapho
  ) =>
  Create' ptr CTOR.Textarea graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "textarea"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnTextarea value
instance createTfoot ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTfoot {}) graphi grapho
  ) =>
  Create' ptr CTOR.Tfoot graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "tfoot"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnTfoot value
instance createTh ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTh {}) graphi grapho
  ) =>
  Create' ptr CTOR.Th graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "th"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnTh value
instance createThead ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TThead {}) graphi grapho
  ) =>
  Create' ptr CTOR.Thead graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "thead"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnThead value
instance createTime ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTime {}) graphi grapho
  ) =>
  Create' ptr CTOR.Time graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "time"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnTime value
instance createTitle ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTitle {}) graphi grapho
  ) =>
  Create' ptr CTOR.Title graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "title"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnTitle value
instance createTr ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTr {}) graphi grapho
  ) =>
  Create' ptr CTOR.Tr graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "tr"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnTr value
instance createTrack ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTrack {}) graphi grapho
  ) =>
  Create' ptr CTOR.Track graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "track"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnTrack value
instance createTt ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTt {}) graphi grapho
  ) =>
  Create' ptr CTOR.Tt graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "tt"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnTt value
instance createU ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TU {}) graphi grapho
  ) =>
  Create' ptr CTOR.U graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "u"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnU value
instance createUl ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TUl {}) graphi grapho
  ) =>
  Create' ptr CTOR.Ul graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "ul"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnUl value
instance createVar ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TVar {}) graphi grapho
  ) =>
  Create' ptr CTOR.Var graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "var"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnVar value
instance createVideo ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TVideo {}) graphi grapho
  ) =>
  Create' ptr CTOR.Video graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "video"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnVideo value
instance createWbr ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TWbr {}) graphi grapho
  ) =>
  Create' ptr CTOR.Wbr graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "wbr"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = CTOR.unsafeUnWbr value
