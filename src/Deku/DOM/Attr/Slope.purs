module Deku.DOM.Attr.Slope where

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

data Slope = Slope

instance Attr FeFuncA_ Slope  String  where
  attr Slope value = unsafeAttribute $ Left $  
    { key: "slope", value: prop' value }
instance Attr FeFuncA_ Slope (Event.Event  String ) where
  attr Slope eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "slope", value: prop' value }


instance Attr FeFuncB_ Slope  String  where
  attr Slope value = unsafeAttribute $ Left $  
    { key: "slope", value: prop' value }
instance Attr FeFuncB_ Slope (Event.Event  String ) where
  attr Slope eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "slope", value: prop' value }


instance Attr FeFuncG_ Slope  String  where
  attr Slope value = unsafeAttribute $ Left $  
    { key: "slope", value: prop' value }
instance Attr FeFuncG_ Slope (Event.Event  String ) where
  attr Slope eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "slope", value: prop' value }


instance Attr FeFuncR_ Slope  String  where
  attr Slope value = unsafeAttribute $ Left $  
    { key: "slope", value: prop' value }
instance Attr FeFuncR_ Slope (Event.Event  String ) where
  attr Slope eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "slope", value: prop' value }


instance Attr everything Slope  Unit  where
  attr Slope _ = unsafeAttribute $ Left $  { key: "slope", value: unset' }
instance Attr everything Slope (Event.Event  Unit ) where
  attr Slope eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "slope", value: unset' }
