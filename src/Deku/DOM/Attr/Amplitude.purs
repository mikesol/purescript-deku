module Deku.DOM.Attr.Amplitude where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeFuncR (FeFuncR_)
import Deku.DOM.Elt.FeFuncG (FeFuncG_)
import Deku.DOM.Elt.FeFuncB (FeFuncB_)
import Deku.DOM.Elt.FeFuncA (FeFuncA_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Amplitude = Amplitude

instance Attr FeFuncA_ Amplitude (NonEmpty.NonEmpty Event.Event  String ) where
  attr Amplitude bothValues = unsafeAttribute $ Both (pure 
    { key: "amplitude", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "amplitude", value: prop' value })
instance Attr FeFuncA_ Amplitude (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Amplitude (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "amplitude", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "amplitude", value: prop' value })
instance Attr FeFuncA_ Amplitude  String  where
  attr Amplitude value = unsafeAttribute $ This $ pure $
    { key: "amplitude", value: prop' value }
instance Attr FeFuncA_ Amplitude (Event.Event  String ) where
  attr Amplitude eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "amplitude", value: prop' value }

instance Attr FeFuncA_ Amplitude (ST.ST Global.Global  String ) where
  attr Amplitude iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "amplitude", value: prop' value }

instance Attr FeFuncB_ Amplitude (NonEmpty.NonEmpty Event.Event  String ) where
  attr Amplitude bothValues = unsafeAttribute $ Both (pure 
    { key: "amplitude", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "amplitude", value: prop' value })
instance Attr FeFuncB_ Amplitude (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Amplitude (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "amplitude", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "amplitude", value: prop' value })
instance Attr FeFuncB_ Amplitude  String  where
  attr Amplitude value = unsafeAttribute $ This $ pure $
    { key: "amplitude", value: prop' value }
instance Attr FeFuncB_ Amplitude (Event.Event  String ) where
  attr Amplitude eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "amplitude", value: prop' value }

instance Attr FeFuncB_ Amplitude (ST.ST Global.Global  String ) where
  attr Amplitude iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "amplitude", value: prop' value }

instance Attr FeFuncG_ Amplitude (NonEmpty.NonEmpty Event.Event  String ) where
  attr Amplitude bothValues = unsafeAttribute $ Both (pure 
    { key: "amplitude", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "amplitude", value: prop' value })
instance Attr FeFuncG_ Amplitude (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Amplitude (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "amplitude", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "amplitude", value: prop' value })
instance Attr FeFuncG_ Amplitude  String  where
  attr Amplitude value = unsafeAttribute $ This $ pure $
    { key: "amplitude", value: prop' value }
instance Attr FeFuncG_ Amplitude (Event.Event  String ) where
  attr Amplitude eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "amplitude", value: prop' value }

instance Attr FeFuncG_ Amplitude (ST.ST Global.Global  String ) where
  attr Amplitude iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "amplitude", value: prop' value }

instance Attr FeFuncR_ Amplitude (NonEmpty.NonEmpty Event.Event  String ) where
  attr Amplitude bothValues = unsafeAttribute $ Both (pure 
    { key: "amplitude", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "amplitude", value: prop' value })
instance Attr FeFuncR_ Amplitude (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Amplitude (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "amplitude", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "amplitude", value: prop' value })
instance Attr FeFuncR_ Amplitude  String  where
  attr Amplitude value = unsafeAttribute $ This $ pure $
    { key: "amplitude", value: prop' value }
instance Attr FeFuncR_ Amplitude (Event.Event  String ) where
  attr Amplitude eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "amplitude", value: prop' value }

instance Attr FeFuncR_ Amplitude (ST.ST Global.Global  String ) where
  attr Amplitude iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "amplitude", value: prop' value }

instance Attr everything Amplitude (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Amplitude bothValues = unsafeAttribute $ Both (pure 
    { key: "amplitude", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "amplitude", value: unset' })
instance Attr everything Amplitude (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Amplitude (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "amplitude", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "amplitude", value: unset' })
instance Attr everything Amplitude  Unit  where
  attr Amplitude _ = unsafeAttribute $ This $ pure $
    { key: "amplitude", value: unset' }
instance Attr everything Amplitude (Event.Event  Unit ) where
  attr Amplitude eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "amplitude", value: unset' }

instance Attr everything Amplitude (ST.ST Global.Global  Unit ) where
  attr Amplitude iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "amplitude", value: unset' }
