module Deku.DOM.Attr.CalcMode where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data CalcMode = CalcMode

instance Attr Animate_ CalcMode  String  where
  attr CalcMode value = unsafeAttribute $ Left $  
    { key: "calcMode", value: prop' value }
instance Attr Animate_ CalcMode (Event.Event  String ) where
  attr CalcMode eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "calcMode", value: prop' value }


instance Attr AnimateMotion_ CalcMode  String  where
  attr CalcMode value = unsafeAttribute $ Left $  
    { key: "calcMode", value: prop' value }
instance Attr AnimateMotion_ CalcMode (Event.Event  String ) where
  attr CalcMode eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "calcMode", value: prop' value }


instance Attr AnimateTransform_ CalcMode  String  where
  attr CalcMode value = unsafeAttribute $ Left $  
    { key: "calcMode", value: prop' value }
instance Attr AnimateTransform_ CalcMode (Event.Event  String ) where
  attr CalcMode eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "calcMode", value: prop' value }


instance Attr everything CalcMode  Unit  where
  attr CalcMode _ = unsafeAttribute $ Left $  
    { key: "calcMode", value: unset' }
instance Attr everything CalcMode (Event.Event  Unit ) where
  attr CalcMode eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "calcMode", value: unset' }
