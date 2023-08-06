module Deku.DOM.Attr.Ry where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Rect (Rect_)
import Deku.DOM.Elt.Ellipse (Ellipse_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Ry = Ry

instance Attr Ellipse_ Ry  String  where
  attr Ry value = unsafeAttribute $ Left $  { key: "ry", value: prop' value }
instance Attr Ellipse_ Ry (Event.Event  String ) where
  attr Ry eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "ry", value: prop' value }


instance Attr Rect_ Ry  String  where
  attr Ry value = unsafeAttribute $ Left $  { key: "ry", value: prop' value }
instance Attr Rect_ Ry (Event.Event  String ) where
  attr Ry eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "ry", value: prop' value }


instance Attr everything Ry  Unit  where
  attr Ry _ = unsafeAttribute $ Left $  { key: "ry", value: unset' }
instance Attr everything Ry (Event.Event  Unit ) where
  attr Ry eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "ry", value: unset' }
