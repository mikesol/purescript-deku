module Deku.DOM.Attr.Cols where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Cols = Cols

instance Attr Textarea_ Cols  String  where
  attr Cols value = unsafeAttribute $ Left $  
    { key: "cols", value: prop' value }
instance Attr Textarea_ Cols (Event.Event  String ) where
  attr Cols eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "cols", value: prop' value }


instance Attr everything Cols  Unit  where
  attr Cols _ = unsafeAttribute $ Left $  { key: "cols", value: unset' }
instance Attr everything Cols (Event.Event  Unit ) where
  attr Cols eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "cols", value: unset' }
