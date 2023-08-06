module Deku.DOM.Attr.Amplitude where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeFuncR (FeFuncR_)
import Deku.DOM.Elt.FeFuncG (FeFuncG_)
import Deku.DOM.Elt.FeFuncB (FeFuncB_)
import Deku.DOM.Elt.FeFuncA (FeFuncA_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Amplitude = Amplitude

instance Attr FeFuncA_ Amplitude  String  where
  attr Amplitude value = unsafeAttribute $ Left $  
    { key: "amplitude", value: prop' value }
instance Attr FeFuncA_ Amplitude (Event.Event  String ) where
  attr Amplitude eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "amplitude", value: prop' value }


instance Attr FeFuncB_ Amplitude  String  where
  attr Amplitude value = unsafeAttribute $ Left $  
    { key: "amplitude", value: prop' value }
instance Attr FeFuncB_ Amplitude (Event.Event  String ) where
  attr Amplitude eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "amplitude", value: prop' value }


instance Attr FeFuncG_ Amplitude  String  where
  attr Amplitude value = unsafeAttribute $ Left $  
    { key: "amplitude", value: prop' value }
instance Attr FeFuncG_ Amplitude (Event.Event  String ) where
  attr Amplitude eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "amplitude", value: prop' value }


instance Attr FeFuncR_ Amplitude  String  where
  attr Amplitude value = unsafeAttribute $ Left $  
    { key: "amplitude", value: prop' value }
instance Attr FeFuncR_ Amplitude (Event.Event  String ) where
  attr Amplitude eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "amplitude", value: prop' value }


instance Attr everything Amplitude  Unit  where
  attr Amplitude _ = unsafeAttribute $ Left $  
    { key: "amplitude", value: unset' }
instance Attr everything Amplitude (Event.Event  Unit ) where
  attr Amplitude eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "amplitude", value: unset' }
