module Deku.DOM.Attr.Intercept where

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

data Intercept = Intercept

instance Attr FeFuncA_ Intercept  String  where
  attr Intercept value = unsafeAttribute $ Left $  
    { key: "intercept", value: prop' value }
instance Attr FeFuncA_ Intercept (Event.Event  String ) where
  attr Intercept eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "intercept", value: prop' value }


instance Attr FeFuncB_ Intercept  String  where
  attr Intercept value = unsafeAttribute $ Left $  
    { key: "intercept", value: prop' value }
instance Attr FeFuncB_ Intercept (Event.Event  String ) where
  attr Intercept eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "intercept", value: prop' value }


instance Attr FeFuncG_ Intercept  String  where
  attr Intercept value = unsafeAttribute $ Left $  
    { key: "intercept", value: prop' value }
instance Attr FeFuncG_ Intercept (Event.Event  String ) where
  attr Intercept eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "intercept", value: prop' value }


instance Attr FeFuncR_ Intercept  String  where
  attr Intercept value = unsafeAttribute $ Left $  
    { key: "intercept", value: prop' value }
instance Attr FeFuncR_ Intercept (Event.Event  String ) where
  attr Intercept eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "intercept", value: prop' value }


instance Attr everything Intercept  Unit  where
  attr Intercept _ = unsafeAttribute $ Left $  
    { key: "intercept", value: unset' }
instance Attr everything Intercept (Event.Event  Unit ) where
  attr Intercept eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "intercept", value: unset' }
