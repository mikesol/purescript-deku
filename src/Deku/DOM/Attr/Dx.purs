module Deku.DOM.Attr.Dx where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Tspan (Tspan_)
import Deku.DOM.Elt.Text (Text_)
import Deku.DOM.Elt.FeOffset (FeOffset_)
import Deku.DOM.Elt.FeDropShadow (FeDropShadow_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Dx = Dx

instance Attr FeDropShadow_ Dx  String  where
  attr Dx value = unsafeAttribute $ Left $  { key: "dx", value: prop' value }
instance Attr FeDropShadow_ Dx (Event.Event  String ) where
  attr Dx eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "dx", value: prop' value }


instance Attr FeOffset_ Dx  String  where
  attr Dx value = unsafeAttribute $ Left $  { key: "dx", value: prop' value }
instance Attr FeOffset_ Dx (Event.Event  String ) where
  attr Dx eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "dx", value: prop' value }


instance Attr Text_ Dx  String  where
  attr Dx value = unsafeAttribute $ Left $  { key: "dx", value: prop' value }
instance Attr Text_ Dx (Event.Event  String ) where
  attr Dx eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "dx", value: prop' value }


instance Attr Tspan_ Dx  String  where
  attr Dx value = unsafeAttribute $ Left $  { key: "dx", value: prop' value }
instance Attr Tspan_ Dx (Event.Event  String ) where
  attr Dx eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "dx", value: prop' value }


instance Attr everything Dx  Unit  where
  attr Dx _ = unsafeAttribute $ Left $  { key: "dx", value: unset' }
instance Attr everything Dx (Event.Event  Unit ) where
  attr Dx eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "dx", value: unset' }
