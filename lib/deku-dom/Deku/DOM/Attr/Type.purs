module Deku.DOM.Attr.Type where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.A (A_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.Area (Area_)
import Deku.DOM.Elt.Button (Button_)
import Deku.DOM.Elt.Embed (Embed_)
import Deku.DOM.Elt.FeColorMatrix (FeColorMatrix_)
import Deku.DOM.Elt.FeComponentTransfer (FeComponentTransfer_)
import Deku.DOM.Elt.FeTurbulence (FeTurbulence_)
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Li (Li_)
import Deku.DOM.Elt.Link (Link_)
import Deku.DOM.Elt.Menu (Menu_)
import Deku.DOM.Elt.Object (Object_)
import Deku.DOM.Elt.Ol (Ol_)
import Deku.DOM.Elt.Script (Script_)
import Deku.DOM.Elt.Source (Source_)
import Deku.DOM.Elt.Style (Style_)
import Deku.DOM.Elt.Ul (Ul_)

data Type = Type

instance Deku.Attribute.Attr everything Type Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "type", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr A_ Type String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "type", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr AnimateTransform_ Type String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "type", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Area_ Type String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "type", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Button_ Type String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "type", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Embed_ Type String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "type", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeColorMatrix_ Type String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "type", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeComponentTransfer_ Type String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "type", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeTurbulence_ Type String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "type", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Input_ Type String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "type", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Li_ Type String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "type", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Link_ Type String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "type", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Menu_ Type String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "type", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Object_ Type String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "type", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Ol_ Type String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "type", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Script_ Type String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "type", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Source_ Type String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "type", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Style_ Type String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "type", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Ul_ Type String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "type", value: _ } <<< Deku.Attribute.prop'
