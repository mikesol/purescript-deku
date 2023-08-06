module Deku.DOM.Attr.Formtarget where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Button (Button_)
import Deku.DOM.Elt.Input (Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Formtarget = Formtarget

instance Attr Button_ Formtarget  String  where
  attr Formtarget value = unsafeAttribute $ Left $  
    { key: "formtarget", value: prop' value }
instance Attr Button_ Formtarget (Event.Event  String ) where
  attr Formtarget eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "formtarget", value: prop' value }


instance Attr Input_ Formtarget  String  where
  attr Formtarget value = unsafeAttribute $ Left $  
    { key: "formtarget", value: prop' value }
instance Attr Input_ Formtarget (Event.Event  String ) where
  attr Formtarget eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "formtarget", value: prop' value }


instance Attr everything Formtarget  Unit  where
  attr Formtarget _ = unsafeAttribute $ Left $  
    { key: "formtarget", value: unset' }
instance Attr everything Formtarget (Event.Event  Unit ) where
  attr Formtarget eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "formtarget", value: unset' }
