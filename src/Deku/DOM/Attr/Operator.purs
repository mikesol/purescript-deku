module Deku.DOM.Attr.Operator where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeMorphology (FeMorphology_)
import Deku.DOM.Elt.FeComposite (FeComposite_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Operator = Operator

instance Attr FeComposite_ Operator  String  where
  attr Operator value = unsafeAttribute $ Left $  
    { key: "operator", value: prop' value }
instance Attr FeComposite_ Operator (Event.Event  String ) where
  attr Operator eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "operator", value: prop' value }


instance Attr FeMorphology_ Operator  String  where
  attr Operator value = unsafeAttribute $ Left $  
    { key: "operator", value: prop' value }
instance Attr FeMorphology_ Operator (Event.Event  String ) where
  attr Operator eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "operator", value: prop' value }


instance Attr everything Operator  Unit  where
  attr Operator _ = unsafeAttribute $ Left $  
    { key: "operator", value: unset' }
instance Attr everything Operator (Event.Event  Unit ) where
  attr Operator eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "operator", value: unset' }
