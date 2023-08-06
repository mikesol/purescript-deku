module Deku.DOM.Attr.Rel where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.A (A_)
import Deku.DOM.Elt.Area (Area_)
import Deku.DOM.Elt.Link (Link_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Rel = Rel

instance Attr A_ Rel  String  where
  attr Rel value = unsafeAttribute $ Left $  { key: "rel", value: prop' value }
instance Attr A_ Rel (Event.Event  String ) where
  attr Rel eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "rel", value: prop' value }


instance Attr Area_ Rel  String  where
  attr Rel value = unsafeAttribute $ Left $  { key: "rel", value: prop' value }
instance Attr Area_ Rel (Event.Event  String ) where
  attr Rel eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "rel", value: prop' value }


instance Attr Link_ Rel  String  where
  attr Rel value = unsafeAttribute $ Left $  { key: "rel", value: prop' value }
instance Attr Link_ Rel (Event.Event  String ) where
  attr Rel eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "rel", value: prop' value }


instance Attr everything Rel  Unit  where
  attr Rel _ = unsafeAttribute $ Left $  { key: "rel", value: unset' }
instance Attr everything Rel (Event.Event  Unit ) where
  attr Rel eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "rel", value: unset' }
