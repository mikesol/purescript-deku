module Deku.DOM.Attr.In2 where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeDisplacementMap (FeDisplacementMap_)
import Deku.DOM.Elt.FeComposite (FeComposite_)
import Deku.DOM.Elt.FeBlend (FeBlend_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data In2 = In2

instance Attr FeBlend_ In2  String  where
  attr In2 value = unsafeAttribute $ Left $  { key: "in2", value: prop' value }
instance Attr FeBlend_ In2 (Event.Event  String ) where
  attr In2 eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "in2", value: prop' value }


instance Attr FeComposite_ In2  String  where
  attr In2 value = unsafeAttribute $ Left $  { key: "in2", value: prop' value }
instance Attr FeComposite_ In2 (Event.Event  String ) where
  attr In2 eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "in2", value: prop' value }


instance Attr FeDisplacementMap_ In2  String  where
  attr In2 value = unsafeAttribute $ Left $  { key: "in2", value: prop' value }
instance Attr FeDisplacementMap_ In2 (Event.Event  String ) where
  attr In2 eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "in2", value: prop' value }


instance Attr everything In2  Unit  where
  attr In2 _ = unsafeAttribute $ Left $  { key: "in2", value: unset' }
instance Attr everything In2 (Event.Event  Unit ) where
  attr In2 eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "in2", value: unset' }
