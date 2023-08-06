module Deku.DOM.Attr.StartOffset where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data StartOffset = StartOffset

instance Attr TextPath_ StartOffset  String  where
  attr StartOffset value = unsafeAttribute $ Left $  
    { key: "startOffset", value: prop' value }
instance Attr TextPath_ StartOffset (Event.Event  String ) where
  attr StartOffset eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "startOffset", value: prop' value }


instance Attr everything StartOffset  Unit  where
  attr StartOffset _ = unsafeAttribute $ Left $  
    { key: "startOffset", value: unset' }
instance Attr everything StartOffset (Event.Event  Unit ) where
  attr StartOffset eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "startOffset", value: unset' }
