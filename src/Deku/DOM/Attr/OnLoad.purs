module Deku.DOM.Attr.OnLoad where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnLoad = OnLoad

instance Attr anything OnLoad (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnLoad bothValues = unsafeAttribute $ Both (pure 
    { key: "load", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "load", value: cb' value })
instance Attr anything OnLoad (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnLoad (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "load", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "load", value: cb' value })
instance Attr anything OnLoad  Cb  where
  attr OnLoad value = unsafeAttribute $ This $ pure $
    { key: "load", value: cb' value }
instance Attr anything OnLoad (Event.Event  Cb ) where
  attr OnLoad eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "load", value: cb' value }

instance Attr anything OnLoad (ST.ST Global.Global  Cb ) where
  attr OnLoad iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "load", value: cb' value }

instance Attr anything OnLoad (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnLoad bothValues = unsafeAttribute $ Both (pure 
    { key: "load", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "load", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnLoad (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnLoad (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "load", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "load", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnLoad  (Effect Unit)  where
  attr OnLoad value = unsafeAttribute $ This $ pure $
    { key: "load", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnLoad (Event.Event  (Effect Unit) ) where
  attr OnLoad eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "load", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnLoad (ST.ST Global.Global  (Effect Unit) ) where
  attr OnLoad iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "load", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnLoad (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnLoad bothValues = unsafeAttribute $ Both (pure 
    { key: "load", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "load", value: cb' (Cb (const value)) }
    )
instance Attr anything OnLoad (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnLoad (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "load", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "load", value: cb' (Cb (const value)) }
    )
instance Attr anything OnLoad  (Effect Boolean)  where
  attr OnLoad value = unsafeAttribute $ This $ pure $
    { key: "load", value: cb' (Cb (const value)) }
instance Attr anything OnLoad (Event.Event  (Effect Boolean) ) where
  attr OnLoad eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "load", value: cb' (Cb (const value)) }

instance Attr anything OnLoad (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnLoad iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "load", value: cb' (Cb (const value)) }

instance Attr everything OnLoad (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnLoad bothValues = unsafeAttribute $ Both (pure  { key: "load", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "load", value: unset' })
instance Attr everything OnLoad (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnLoad (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->   { key: "load", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "load", value: unset' })
instance Attr everything OnLoad  Unit  where
  attr OnLoad _ = unsafeAttribute $ This $ { key: "load", value: unset' }
instance Attr everything OnLoad (Event.Event  Unit ) where
  attr OnLoad eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "load", value: unset' }

instance Attr everything OnLoad (ST.ST Global.Global  Unit ) where
  attr OnLoad iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "load", value: unset' }
