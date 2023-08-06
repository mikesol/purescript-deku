module Deku.DOM.Attr.Shape where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.A (A_)
import Deku.DOM.Elt.Area (Area_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Shape = Shape

instance Attr A_ Shape  String  where
  attr Shape value = unsafeAttribute $ Left $  
    { key: "shape", value: prop' value }
instance Attr A_ Shape (Event.Event  String ) where
  attr Shape eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "shape", value: prop' value }


instance Attr Area_ Shape  String  where
  attr Shape value = unsafeAttribute $ Left $  
    { key: "shape", value: prop' value }
instance Attr Area_ Shape (Event.Event  String ) where
  attr Shape eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "shape", value: prop' value }


instance Attr everything Shape  Unit  where
  attr Shape _ = unsafeAttribute $ Left $  { key: "shape", value: unset' }
instance Attr everything Shape (Event.Event  Unit ) where
  attr Shape eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "shape", value: unset' }
