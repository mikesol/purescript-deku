module Deku.DOM.Attr.Integrity where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Link (Link_)
import Deku.DOM.Elt.Script (Script_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Integrity = Integrity

instance Attr Link_ Integrity  String  where
  attr Integrity value = unsafeAttribute $ Left $  
    { key: "integrity", value: prop' value }
instance Attr Link_ Integrity (Event.Event  String ) where
  attr Integrity eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "integrity", value: prop' value }


instance Attr Script_ Integrity  String  where
  attr Integrity value = unsafeAttribute $ Left $  
    { key: "integrity", value: prop' value }
instance Attr Script_ Integrity (Event.Event  String ) where
  attr Integrity eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "integrity", value: prop' value }


instance Attr everything Integrity  Unit  where
  attr Integrity _ = unsafeAttribute $ Left $  
    { key: "integrity", value: unset' }
instance Attr everything Integrity (Event.Event  Unit ) where
  attr Integrity eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "integrity", value: unset' }
