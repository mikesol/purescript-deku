module Deku.DOM.Attr.SpecularExponent where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeSpotLight (FeSpotLight_)
import Deku.DOM.Elt.FeSpecularLighting (FeSpecularLighting_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data SpecularExponent = SpecularExponent

instance Attr FeSpecularLighting_ SpecularExponent (NonEmpty.NonEmpty Event.Event  String ) where
  attr SpecularExponent bothValues = unsafeAttribute $ Both (pure 
    { key: "specularExponent", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "specularExponent", value: prop' value }
    )
instance Attr FeSpecularLighting_ SpecularExponent (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr SpecularExponent (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "specularExponent", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "specularExponent", value: prop' value }
    )
instance Attr FeSpecularLighting_ SpecularExponent  String  where
  attr SpecularExponent value = unsafeAttribute $ This $ pure $
    { key: "specularExponent", value: prop' value }
instance Attr FeSpecularLighting_ SpecularExponent (Event.Event  String ) where
  attr SpecularExponent eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "specularExponent", value: prop' value }

instance Attr FeSpecularLighting_ SpecularExponent (ST.ST Global.Global  String ) where
  attr SpecularExponent stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "specularExponent", value: prop' value }

instance Attr FeSpotLight_ SpecularExponent (NonEmpty.NonEmpty Event.Event  String ) where
  attr SpecularExponent bothValues = unsafeAttribute $ Both (pure 
    { key: "specularExponent", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "specularExponent", value: prop' value }
    )
instance Attr FeSpotLight_ SpecularExponent (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr SpecularExponent (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "specularExponent", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "specularExponent", value: prop' value }
    )
instance Attr FeSpotLight_ SpecularExponent  String  where
  attr SpecularExponent value = unsafeAttribute $ This $ pure $
    { key: "specularExponent", value: prop' value }
instance Attr FeSpotLight_ SpecularExponent (Event.Event  String ) where
  attr SpecularExponent eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "specularExponent", value: prop' value }

instance Attr FeSpotLight_ SpecularExponent (ST.ST Global.Global  String ) where
  attr SpecularExponent stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "specularExponent", value: prop' value }

instance Attr everything SpecularExponent (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr SpecularExponent bothValues = unsafeAttribute $ Both (pure 
    { key: "specularExponent", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "specularExponent", value: unset' })
instance Attr everything SpecularExponent (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr SpecularExponent (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "specularExponent", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "specularExponent", value: unset' })
instance Attr everything SpecularExponent  Unit  where
  attr SpecularExponent _ = unsafeAttribute $ This $ pure $
    { key: "specularExponent", value: unset' }
instance Attr everything SpecularExponent (Event.Event  Unit ) where
  attr SpecularExponent eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "specularExponent", value: unset' }

instance Attr everything SpecularExponent (ST.ST Global.Global  Unit ) where
  attr SpecularExponent stValue = unsafeAttribute $ This $ stValue
    <#> \_ -> { key: "specularExponent", value: unset' }
