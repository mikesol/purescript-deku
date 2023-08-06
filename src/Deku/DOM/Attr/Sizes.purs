module Deku.DOM.Attr.Sizes where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Link (Link_)
import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Source (Source_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Sizes = Sizes

instance Attr Link_ Sizes  String  where
  attr Sizes value = unsafeAttribute $ Left $  
    { key: "sizes", value: prop' value }
instance Attr Link_ Sizes (Event.Event  String ) where
  attr Sizes eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "sizes", value: prop' value }


instance Attr Img_ Sizes  String  where
  attr Sizes value = unsafeAttribute $ Left $  
    { key: "sizes", value: prop' value }
instance Attr Img_ Sizes (Event.Event  String ) where
  attr Sizes eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "sizes", value: prop' value }


instance Attr Source_ Sizes  String  where
  attr Sizes value = unsafeAttribute $ Left $  
    { key: "sizes", value: prop' value }
instance Attr Source_ Sizes (Event.Event  String ) where
  attr Sizes eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "sizes", value: prop' value }


instance Attr everything Sizes  Unit  where
  attr Sizes _ = unsafeAttribute $ Left $  { key: "sizes", value: unset' }
instance Attr everything Sizes (Event.Event  Unit ) where
  attr Sizes eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "sizes", value: unset' }
