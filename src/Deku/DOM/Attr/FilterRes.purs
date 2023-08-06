module Deku.DOM.Attr.FilterRes where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Filter (Filter_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data FilterRes = FilterRes

instance Attr Filter_ FilterRes  String  where
  attr FilterRes value = unsafeAttribute $ Left $  
    { key: "filterRes", value: prop' value }
instance Attr Filter_ FilterRes (Event.Event  String ) where
  attr FilterRes eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "filterRes", value: prop' value }


instance Attr everything FilterRes  Unit  where
  attr FilterRes _ = unsafeAttribute $ Left $  
    { key: "filterRes", value: unset' }
instance Attr everything FilterRes (Event.Event  Unit ) where
  attr FilterRes eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "filterRes", value: unset' }
