module Deku.DOM.Attr.Restart where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Set (Set_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Restart = Restart

instance Attr Animate_ Restart  String  where
  attr Restart value = unsafeAttribute $ Left $  
    { key: "restart", value: prop' value }
instance Attr Animate_ Restart (Event.Event  String ) where
  attr Restart eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "restart", value: prop' value }


instance Attr AnimateMotion_ Restart  String  where
  attr Restart value = unsafeAttribute $ Left $  
    { key: "restart", value: prop' value }
instance Attr AnimateMotion_ Restart (Event.Event  String ) where
  attr Restart eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "restart", value: prop' value }


instance Attr AnimateTransform_ Restart  String  where
  attr Restart value = unsafeAttribute $ Left $  
    { key: "restart", value: prop' value }
instance Attr AnimateTransform_ Restart (Event.Event  String ) where
  attr Restart eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "restart", value: prop' value }


instance Attr Set_ Restart  String  where
  attr Restart value = unsafeAttribute $ Left $  
    { key: "restart", value: prop' value }
instance Attr Set_ Restart (Event.Event  String ) where
  attr Restart eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "restart", value: prop' value }


instance Attr everything Restart  Unit  where
  attr Restart _ = unsafeAttribute $ Left $  { key: "restart", value: unset' }
instance Attr everything Restart (Event.Event  Unit ) where
  attr Restart eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "restart", value: unset' }
