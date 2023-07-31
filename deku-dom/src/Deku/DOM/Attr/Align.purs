module Deku.DOM.Attr.Align where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Caption (Caption_)
import Deku.DOM.Elt.Col (Col_)
import Deku.DOM.Elt.Div (Div_)
import Deku.DOM.Elt.Embed (Embed_)
import Deku.DOM.Elt.H1 (H1_)
import Deku.DOM.Elt.H2 (H2_)
import Deku.DOM.Elt.H3 (H3_)
import Deku.DOM.Elt.H4 (H4_)
import Deku.DOM.Elt.H5 (H5_)
import Deku.DOM.Elt.H6 (H6_)
import Deku.DOM.Elt.Hr (Hr_)
import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Legend (Legend_)
import Deku.DOM.Elt.Object (Object_)
import Deku.DOM.Elt.P (P_)
import Deku.DOM.Elt.Table (Table_)
import Deku.DOM.Elt.Tbody (Tbody_)
import Deku.DOM.Elt.Td (Td_)
import Deku.DOM.Elt.Th (Th_)
import Deku.DOM.Elt.Tr (Tr_)

data Align = Align

instance Deku.Attribute.Attr everything Align Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "align", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Caption_ Align String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "align", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Col_ Align String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "align", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Div_ Align String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "align", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Embed_ Align String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "align", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr H1_ Align String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "align", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr H2_ Align String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "align", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr H3_ Align String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "align", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr H4_ Align String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "align", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr H5_ Align String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "align", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr H6_ Align String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "align", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Hr_ Align String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "align", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Iframe_ Align String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "align", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Img_ Align String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "align", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Input_ Align String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "align", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Legend_ Align String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "align", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Object_ Align String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "align", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr P_ Align String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "align", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Table_ Align String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "align", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Tbody_ Align String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "align", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Td_ Align String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "align", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Th_ Align String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "align", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Tr_ Align String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "align", value: _ } <<< Deku.Attribute.prop'
