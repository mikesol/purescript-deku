module Deku.DOM.Attr.Novalidate where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Form (Form_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Novalidate = Novalidate

instance Attr Form_ Novalidate  String  where
  attr Novalidate value = unsafeAttribute $ Left $  
    { key: "novalidate", value: prop' value }
instance Attr Form_ Novalidate (Event.Event  String ) where
  attr Novalidate eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "novalidate", value: prop' value }


instance Attr everything Novalidate  Unit  where
  attr Novalidate _ = unsafeAttribute $ Left $  
    { key: "novalidate", value: unset' }
instance Attr everything Novalidate (Event.Event  Unit ) where
  attr Novalidate eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "novalidate", value: unset' }
