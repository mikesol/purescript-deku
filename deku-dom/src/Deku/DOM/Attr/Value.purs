module Deku.DOM.Attr.Value where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Button (Button_)
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Li (Li_)
import Deku.DOM.Elt.Meter (Meter_)
import Deku.DOM.Elt.Option (Option_)
import Deku.DOM.Elt.Progress (Progress_)
import Deku.DOM.Elt.Xdata (Xdata_)

data Value = Value

instance Deku.Attribute.Attr everything Value Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "value", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Button_ Value String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "value", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Input_ Value String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "value", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Li_ Value String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "value", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Meter_ Value String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "value", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Option_ Value String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "value", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Progress_ Value String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "value", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Xdata_ Value String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "value", value: _ } <<< Deku.Attribute.prop'
