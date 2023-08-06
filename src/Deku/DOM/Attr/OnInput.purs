module Deku.DOM.Attr.OnInput where

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

data OnInput = OnInput

instance Attr anything OnInput (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnInput bothValues = unsafeAttribute $ Both (pure 
    { key: "input", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "input", value: cb' value })
instance Attr anything OnInput (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnInput (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "input", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "input", value: cb' value })
instance Attr anything OnInput  Cb  where
  attr OnInput value = unsafeAttribute $ This $ pure $
    { key: "input", value: cb' value }
instance Attr anything OnInput (Event.Event  Cb ) where
  attr OnInput eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "input", value: cb' value }

instance Attr anything OnInput (ST.ST Global.Global  Cb ) where
  attr OnInput iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "input", value: cb' value }

instance Attr anything OnInput (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnInput bothValues = unsafeAttribute $ Both (pure 
    { key: "input", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "input", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnInput (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnInput (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "input", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "input", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnInput  (Effect Unit)  where
  attr OnInput value = unsafeAttribute $ This $ pure $
    { key: "input", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnInput (Event.Event  (Effect Unit) ) where
  attr OnInput eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "input", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnInput (ST.ST Global.Global  (Effect Unit) ) where
  attr OnInput iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "input", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnInput (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnInput bothValues = unsafeAttribute $ Both (pure 
    { key: "input", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "input", value: cb' (Cb (const value)) }
    )
instance Attr anything OnInput (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnInput (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "input", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "input", value: cb' (Cb (const value)) }
    )
instance Attr anything OnInput  (Effect Boolean)  where
  attr OnInput value = unsafeAttribute $ This $ pure $
    { key: "input", value: cb' (Cb (const value)) }
instance Attr anything OnInput (Event.Event  (Effect Boolean) ) where
  attr OnInput eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "input", value: cb' (Cb (const value)) }

instance Attr anything OnInput (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnInput iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "input", value: cb' (Cb (const value)) }

instance Attr everything OnInput (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnInput bothValues = unsafeAttribute $ Both (pure 
    { key: "input", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "input", value: unset' })
instance Attr everything OnInput (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnInput (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "input", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "input", value: unset' })
instance Attr everything OnInput  Unit  where
  attr OnInput _ = unsafeAttribute $ This $ { key: "input", value: unset' }
instance Attr everything OnInput (Event.Event  Unit ) where
  attr OnInput eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "input", value: unset' }

instance Attr everything OnInput (ST.ST Global.Global  Unit ) where
  attr OnInput iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "input", value: unset' }
