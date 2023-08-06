module Deku.DOM.Attr.Values where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeColorMatrix (FeColorMatrix_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Values = Values

instance Attr Animate_ Values  String  where
  attr Values value = unsafeAttribute $ Left $  
    { key: "values", value: prop' value }
instance Attr Animate_ Values (Event.Event  String ) where
  attr Values eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "values", value: prop' value }


instance Attr AnimateMotion_ Values  String  where
  attr Values value = unsafeAttribute $ Left $  
    { key: "values", value: prop' value }
instance Attr AnimateMotion_ Values (Event.Event  String ) where
  attr Values eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "values", value: prop' value }


instance Attr AnimateTransform_ Values  String  where
  attr Values value = unsafeAttribute $ Left $  
    { key: "values", value: prop' value }
instance Attr AnimateTransform_ Values (Event.Event  String ) where
  attr Values eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "values", value: prop' value }


instance Attr FeColorMatrix_ Values  String  where
  attr Values value = unsafeAttribute $ Left $  
    { key: "values", value: prop' value }
instance Attr FeColorMatrix_ Values (Event.Event  String ) where
  attr Values eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "values", value: prop' value }


instance Attr everything Values  Unit  where
  attr Values _ = unsafeAttribute $ Left $  { key: "values", value: unset' }
instance Attr everything Values (Event.Event  Unit ) where
  attr Values eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "values", value: unset' }
