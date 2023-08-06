module Deku.DOM.Attr.Inputmode where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Inputmode = Inputmode

instance Attr Textarea_ Inputmode  String  where
  attr Inputmode value = unsafeAttribute $ Left $  
    { key: "inputmode", value: prop' value }
instance Attr Textarea_ Inputmode (Event.Event  String ) where
  attr Inputmode eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "inputmode", value: prop' value }


instance Attr everything Inputmode  Unit  where
  attr Inputmode _ = unsafeAttribute $ Left $  
    { key: "inputmode", value: unset' }
instance Attr everything Inputmode (Event.Event  Unit ) where
  attr Inputmode eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "inputmode", value: unset' }
