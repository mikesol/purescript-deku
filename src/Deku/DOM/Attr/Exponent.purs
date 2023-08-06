module Deku.DOM.Attr.Exponent where

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

data Exponent = Exponent

instance Attr FeFuncA_ Exponent  String  where
  attr Exponent value = unsafeAttribute $ Left $  
    { key: "exponent", value: prop' value }
instance Attr FeFuncA_ Exponent (Event.Event  String ) where
  attr Exponent eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "exponent", value: prop' value }


instance Attr FeFuncB_ Exponent  String  where
  attr Exponent value = unsafeAttribute $ Left $  
    { key: "exponent", value: prop' value }
instance Attr FeFuncB_ Exponent (Event.Event  String ) where
  attr Exponent eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "exponent", value: prop' value }


instance Attr FeFuncG_ Exponent  String  where
  attr Exponent value = unsafeAttribute $ Left $  
    { key: "exponent", value: prop' value }
instance Attr FeFuncG_ Exponent (Event.Event  String ) where
  attr Exponent eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "exponent", value: prop' value }


instance Attr FeFuncR_ Exponent  String  where
  attr Exponent value = unsafeAttribute $ Left $  
    { key: "exponent", value: prop' value }
instance Attr FeFuncR_ Exponent (Event.Event  String ) where
  attr Exponent eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "exponent", value: prop' value }


instance Attr everything Exponent  Unit  where
  attr Exponent _ = unsafeAttribute $ Left $  
    { key: "exponent", value: unset' }
instance Attr everything Exponent (Event.Event  Unit ) where
  attr Exponent eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "exponent", value: unset' }
