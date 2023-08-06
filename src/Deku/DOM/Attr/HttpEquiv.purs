module Deku.DOM.Attr.HttpEquiv where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Meta (Meta_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data HttpEquiv = HttpEquiv

instance Attr Meta_ HttpEquiv  String  where
  attr HttpEquiv value = unsafeAttribute $ Left $  
    { key: "http-equiv", value: prop' value }
instance Attr Meta_ HttpEquiv (Event.Event  String ) where
  attr HttpEquiv eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "http-equiv", value: prop' value }


instance Attr everything HttpEquiv  Unit  where
  attr HttpEquiv _ = unsafeAttribute $ Left $  
    { key: "http-equiv", value: unset' }
instance Attr everything HttpEquiv (Event.Event  Unit ) where
  attr HttpEquiv eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "http-equiv", value: unset' }
