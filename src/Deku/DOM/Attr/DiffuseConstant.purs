module Deku.DOM.Attr.DiffuseConstant where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeDiffuseLighting (FeDiffuseLighting_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data DiffuseConstant = DiffuseConstant

instance Attr FeDiffuseLighting_ DiffuseConstant (NonEmpty.NonEmpty Event.Event  String ) where
  attr DiffuseConstant bothValues = unsafeAttribute $ Both (pure 
    { key: "diffuseConstant", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "diffuseConstant", value: prop' value }
    )
instance Attr FeDiffuseLighting_ DiffuseConstant (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr DiffuseConstant (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "diffuseConstant", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "diffuseConstant", value: prop' value }
    )
instance Attr FeDiffuseLighting_ DiffuseConstant  String  where
  attr DiffuseConstant value = unsafeAttribute $ This $ pure $
    { key: "diffuseConstant", value: prop' value }
instance Attr FeDiffuseLighting_ DiffuseConstant (Event.Event  String ) where
  attr DiffuseConstant eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "diffuseConstant", value: prop' value }

instance Attr FeDiffuseLighting_ DiffuseConstant (ST.ST Global.Global  String ) where
  attr DiffuseConstant iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "diffuseConstant", value: prop' value }

instance Attr everything DiffuseConstant (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr DiffuseConstant bothValues = unsafeAttribute $ Both (pure 
    { key: "diffuseConstant", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "diffuseConstant", value: unset' })
instance Attr everything DiffuseConstant (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr DiffuseConstant (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "diffuseConstant", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "diffuseConstant", value: unset' })
instance Attr everything DiffuseConstant  Unit  where
  attr DiffuseConstant _ = unsafeAttribute $ This $ pure $
    { key: "diffuseConstant", value: unset' }
instance Attr everything DiffuseConstant (Event.Event  Unit ) where
  attr DiffuseConstant eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "diffuseConstant", value: unset' }

instance Attr everything DiffuseConstant (ST.ST Global.Global  Unit ) where
  attr DiffuseConstant iValue = unsafeAttribute $ This $ iValue
    <#> \_ -> { key: "diffuseConstant", value: unset' }
