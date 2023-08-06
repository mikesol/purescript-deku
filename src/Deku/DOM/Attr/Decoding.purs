module Deku.DOM.Attr.Decoding where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Img (Img_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Decoding = Decoding

instance Attr Img_ Decoding  String  where
  attr Decoding value = unsafeAttribute $ Left $  
    { key: "decoding", value: prop' value }
instance Attr Img_ Decoding (Event.Event  String ) where
  attr Decoding eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "decoding", value: prop' value }


instance Attr everything Decoding  Unit  where
  attr Decoding _ = unsafeAttribute $ Left $  
    { key: "decoding", value: unset' }
instance Attr everything Decoding (Event.Event  Unit ) where
  attr Decoding eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "decoding", value: unset' }
