module Deku.DOM.Attr.KeySplines where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data KeySplines = KeySplines

instance Attr Animate_ KeySplines  String  where
  attr KeySplines value = unsafeAttribute $ Left $  
    { key: "keySplines", value: prop' value }
instance Attr Animate_ KeySplines (Event.Event  String ) where
  attr KeySplines eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "keySplines", value: prop' value }


instance Attr AnimateMotion_ KeySplines  String  where
  attr KeySplines value = unsafeAttribute $ Left $  
    { key: "keySplines", value: prop' value }
instance Attr AnimateMotion_ KeySplines (Event.Event  String ) where
  attr KeySplines eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "keySplines", value: prop' value }


instance Attr AnimateTransform_ KeySplines  String  where
  attr KeySplines value = unsafeAttribute $ Left $  
    { key: "keySplines", value: prop' value }
instance Attr AnimateTransform_ KeySplines (Event.Event  String ) where
  attr KeySplines eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "keySplines", value: prop' value }


instance Attr everything KeySplines  Unit  where
  attr KeySplines _ = unsafeAttribute $ Left $  
    { key: "keySplines", value: unset' }
instance Attr everything KeySplines (Event.Event  Unit ) where
  attr KeySplines eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "keySplines", value: unset' }
