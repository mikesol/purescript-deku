module Deku.DOM.Attr.SpreadMethod where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.DOM.Elt.LinearGradient (LinearGradient_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data SpreadMethod = SpreadMethod

instance Attr LinearGradient_ SpreadMethod  String  where
  attr SpreadMethod value = unsafeAttribute $ Left $  
    { key: "spreadMethod", value: prop' value }
instance Attr LinearGradient_ SpreadMethod (Event.Event  String ) where
  attr SpreadMethod eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "spreadMethod", value: prop' value }


instance Attr RadialGradient_ SpreadMethod  String  where
  attr SpreadMethod value = unsafeAttribute $ Left $  
    { key: "spreadMethod", value: prop' value }
instance Attr RadialGradient_ SpreadMethod (Event.Event  String ) where
  attr SpreadMethod eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "spreadMethod", value: prop' value }


instance Attr everything SpreadMethod  Unit  where
  attr SpreadMethod _ = unsafeAttribute $ Left $  
    { key: "spreadMethod", value: unset' }
instance Attr everything SpreadMethod (Event.Event  Unit ) where
  attr SpreadMethod eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "spreadMethod", value: unset' }
