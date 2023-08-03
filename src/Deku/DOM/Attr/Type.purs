module Deku.DOM.Attr.Type where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeTurbulence (FeTurbulence_)
import Deku.DOM.Elt.FeFuncR (FeFuncR_)
import Deku.DOM.Elt.FeFuncG (FeFuncG_)
import Deku.DOM.Elt.FeFuncB (FeFuncB_)
import Deku.DOM.Elt.FeFuncA (FeFuncA_)
import Deku.DOM.Elt.FeColorMatrix (FeColorMatrix_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Type = Type

instance Attr AnimateTransform_ Type (NonEmpty.NonEmpty Event.Event  String ) where
  attr Type bothValues = unsafeAttribute $ Both (pure 
    { key: "type", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "type", value: prop' value })
instance Attr AnimateTransform_ Type (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Type (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "type", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "type", value: prop' value })
instance Attr AnimateTransform_ Type  String  where
  attr Type value = unsafeAttribute $ This $ pure $
    { key: "type", value: prop' value }
instance Attr AnimateTransform_ Type (Event.Event  String ) where
  attr Type eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "type", value: prop' value }

instance Attr AnimateTransform_ Type (ST.ST Global.Global  String ) where
  attr Type stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "type", value: prop' value }

instance Attr FeColorMatrix_ Type (NonEmpty.NonEmpty Event.Event  String ) where
  attr Type bothValues = unsafeAttribute $ Both (pure 
    { key: "type", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "type", value: prop' value })
instance Attr FeColorMatrix_ Type (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Type (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "type", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "type", value: prop' value })
instance Attr FeColorMatrix_ Type  String  where
  attr Type value = unsafeAttribute $ This $ pure $
    { key: "type", value: prop' value }
instance Attr FeColorMatrix_ Type (Event.Event  String ) where
  attr Type eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "type", value: prop' value }

instance Attr FeColorMatrix_ Type (ST.ST Global.Global  String ) where
  attr Type stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "type", value: prop' value }

instance Attr FeFuncA_ Type (NonEmpty.NonEmpty Event.Event  String ) where
  attr Type bothValues = unsafeAttribute $ Both (pure 
    { key: "type", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "type", value: prop' value })
instance Attr FeFuncA_ Type (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Type (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "type", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "type", value: prop' value })
instance Attr FeFuncA_ Type  String  where
  attr Type value = unsafeAttribute $ This $ pure $
    { key: "type", value: prop' value }
instance Attr FeFuncA_ Type (Event.Event  String ) where
  attr Type eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "type", value: prop' value }

instance Attr FeFuncA_ Type (ST.ST Global.Global  String ) where
  attr Type stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "type", value: prop' value }

instance Attr FeFuncB_ Type (NonEmpty.NonEmpty Event.Event  String ) where
  attr Type bothValues = unsafeAttribute $ Both (pure 
    { key: "type", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "type", value: prop' value })
instance Attr FeFuncB_ Type (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Type (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "type", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "type", value: prop' value })
instance Attr FeFuncB_ Type  String  where
  attr Type value = unsafeAttribute $ This $ pure $
    { key: "type", value: prop' value }
instance Attr FeFuncB_ Type (Event.Event  String ) where
  attr Type eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "type", value: prop' value }

instance Attr FeFuncB_ Type (ST.ST Global.Global  String ) where
  attr Type stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "type", value: prop' value }

instance Attr FeFuncG_ Type (NonEmpty.NonEmpty Event.Event  String ) where
  attr Type bothValues = unsafeAttribute $ Both (pure 
    { key: "type", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "type", value: prop' value })
instance Attr FeFuncG_ Type (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Type (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "type", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "type", value: prop' value })
instance Attr FeFuncG_ Type  String  where
  attr Type value = unsafeAttribute $ This $ pure $
    { key: "type", value: prop' value }
instance Attr FeFuncG_ Type (Event.Event  String ) where
  attr Type eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "type", value: prop' value }

instance Attr FeFuncG_ Type (ST.ST Global.Global  String ) where
  attr Type stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "type", value: prop' value }

instance Attr FeFuncR_ Type (NonEmpty.NonEmpty Event.Event  String ) where
  attr Type bothValues = unsafeAttribute $ Both (pure 
    { key: "type", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "type", value: prop' value })
instance Attr FeFuncR_ Type (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Type (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "type", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "type", value: prop' value })
instance Attr FeFuncR_ Type  String  where
  attr Type value = unsafeAttribute $ This $ pure $
    { key: "type", value: prop' value }
instance Attr FeFuncR_ Type (Event.Event  String ) where
  attr Type eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "type", value: prop' value }

instance Attr FeFuncR_ Type (ST.ST Global.Global  String ) where
  attr Type stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "type", value: prop' value }

instance Attr FeTurbulence_ Type (NonEmpty.NonEmpty Event.Event  String ) where
  attr Type bothValues = unsafeAttribute $ Both (pure 
    { key: "type", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "type", value: prop' value })
instance Attr FeTurbulence_ Type (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Type (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "type", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "type", value: prop' value })
instance Attr FeTurbulence_ Type  String  where
  attr Type value = unsafeAttribute $ This $ pure $
    { key: "type", value: prop' value }
instance Attr FeTurbulence_ Type (Event.Event  String ) where
  attr Type eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "type", value: prop' value }

instance Attr FeTurbulence_ Type (ST.ST Global.Global  String ) where
  attr Type stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "type", value: prop' value }

instance Attr everything Type (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Type bothValues = unsafeAttribute $ Both (pure  { key: "type", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "type", value: unset' })
instance Attr everything Type (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Type (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->   { key: "type", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "type", value: unset' })
instance Attr everything Type  Unit  where
  attr Type _ = unsafeAttribute $ This $ pure $ { key: "type", value: unset' }
instance Attr everything Type (Event.Event  Unit ) where
  attr Type eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "type", value: unset' }

instance Attr everything Type (ST.ST Global.Global  Unit ) where
  attr Type stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "type", value: unset' }
